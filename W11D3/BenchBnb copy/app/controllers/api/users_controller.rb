class Api::UsersController < ApplicationController

  def create 
    @user = User.new(user_params)

    if @user.save 
      login!(@user)
      # double check?
      render '/api/users/show'
      # redirect_to api_user_url
    else
        render json: @user.errors.full_messages
    end

  end

  private 
  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end
end
