class Api::SessionsController < ApplicationController
    
    def destroy
        @user = current_user
        if @user
            logout
            render "api/users/show"
        else
            render json: ["no user to logout!"], status: 404
        end
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            login!(@user)
             render '/api/users/show'
        else
            render json: ["invalid credentials"], status: 401
        end
    end

end
