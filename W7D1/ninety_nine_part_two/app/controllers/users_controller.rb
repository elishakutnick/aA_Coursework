class UsersController < ApplicationController
  before_action :require_login, except: :new

  def new
    @user = User.new 
    render :new
  end

  def create
    new_user = User.new(new_user_params)
    if new_user 
      new_user.save
      login(new_user)
    else
      render json: 'Try again'
    end
  end

  private
  def new_user_params
    params.require(:user).permit(:user_name, :password)
  end
end
