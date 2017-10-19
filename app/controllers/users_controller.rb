class UsersController < ApplicationController
    def index
        redirect_to new_user_path
    end
    
    def new
    end
    
    def create
        @user = User.create!(params[:user])
        flash[:notice] = "#{@user.username} was successfully created."
        # Should also log you in before redirecting
        session[:username] = @user.username
        ####
        redirect_to root_path
    end
end
