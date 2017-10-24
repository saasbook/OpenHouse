class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:email, :password, :street_address, :city, :state, :zip_code, :first_name, :last_name, :credit_card_number, :expiration_date, :cvv)
    end

    def new
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
    
    def edit
        @user = current_user
    end

    def email_exists(email)
        User.find_by(email: email)
    end

    def email_valid(email)
        return email =~ /[a-zA-Z_\.0-9]+@[a-zA-Z_\.0-9]+\.[a-zA-Z_\.0-9]+/
    end

    def update
        @user = current_user
        # params[:user][:password] = @user.password
        # @user.update_attributes(user_params)
        @user.update_attribute(:email, user_params[:email])
        @user.update_attribute(:street_address, user_params[:street_address])
        @user.update_attribute(:city, user_params[:city])
        @user.update_attribute(:state, user_params[:state])
        @user.update_attribute(:zip_code, user_params[:zip_code])
        @user.update_attribute(:first_name, user_params[:first_name])
        @user.update_attribute(:last_name, user_params[:last_name])
        @user.update_attribute(:credit_card_number, user_params[:credit_card_number])
        @user.update_attribute(:expiration_date, user_params[:expiration_date])
        @user.update_attribute(:cvv, user_params[:cvv])
        @user.save
        # @user.update_attributes!(:address => user_params[:address])
        flash[:notice] = "Your account has been updated!"
        redirect_to root_path
        # redirect_to user_path
    end
    
    def destroy
        @user = current_user
        log_out
        @user.destroy
        flash[:notice] = "Your account has been deleted."
        redirect_to root_path
    end
    #def authenticate(email, password)
    #    if email_exists
    #        User.find_by(email: email).password == password
    #    else
    #        flash[:notice] = "An account with that e-mail address does not exist."
    #        return false;
    #    end
    #end
end

