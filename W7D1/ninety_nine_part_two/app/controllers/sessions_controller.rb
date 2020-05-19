class SessionsController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )
    if user
      login(user) 
    else
      render json: 'User does not exist'
    end 
  end

  def destroy
    logout
    redirect_to cats_url    
  end

end
