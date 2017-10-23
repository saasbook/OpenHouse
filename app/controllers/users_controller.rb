class UsersController < ApplicationController
    private def user_params
        params.require(:user).permit(:email, :password, :street_address, :city, :state, :zip_code, :first_name, :last_name, :credit_card_number, :expiration_date, :cvv, :password_confirmation)
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end
    
    def create
        if email_exists(params[:user][:email])
            flash[:notice] = "An account with that e-mail address already exists."
            redirect_to new_user_path
        elsif not email_valid(params[:user][:email])
            flash[:notice] = "Please enter a valid e-mail address."
            redirect_to new_user_path
        else
            @user = User.create!(user_params)
            flash[:notice] = "#{@user.email} was successfully created."
            session[:email] = @user.email
            redirect_to login_path
        end
    end

    private def email_exists(email)
        User.find_by(email: email)
    end

    private def email_valid(email)
        return email =~ /[a-zA-Z_\.0-9]+@[a-zA-Z_\.0-9]+\.[a-zA-Z_\.0-9]+/
    end
end
