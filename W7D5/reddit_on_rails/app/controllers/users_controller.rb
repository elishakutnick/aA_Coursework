class UsersController < ApplicationController
  def new
    render :new 
  end

  def create 
  end

  private

  def new_user_params
    self.params.require(:user).permit(:username, :password_digest, :session_token)
  end
end
