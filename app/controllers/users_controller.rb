class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:username, :password, :name, :email, :credit_card_number, :address)
    end

    def new
    end
    
    def create
        session[:old_params] = params
        @user = User.create!(user_params)
        flash[:notice] = "#{@user.username} was successfully created."
        flash[:username] = params[:username]
        session[:username] = @user.username
        redirect_to login_path
    end
    
    def edit
    end
    
    def show
        @user = User.where({username: session["username"]}).first
    end
end
