class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:username, :password, :name, :email, :credit_card_number, :address)
    end

    def index
        redirect_to new_user_path
    end
    
    def new
    end
    
    def create
        session[:old_params] = params
        @user = User.create!(user_params)
        flash[:notice] = "#{@user.username} was successfully created."
        # Should also log you in before redirecting
        session[:username] = @user.username
        ####
        redirect_to root_path
    end
end
