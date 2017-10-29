class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:email, :password, :billing_street_address, :billing_city, :billing_state, :billing_zip_code, :first_name, :last_name, :credit_card_number, :expiration_date, :cvv, :home_street_address, :home_city, :home_state, :home_zip_code, :profile_picture, :personal_description, :house_picture, :house_description)
    end

    def new
    end
    
    def create
        @user = User.create(user_params)
        next_path = new_user_path
        if @user.errors.empty?
            next_path = login_path
            flash[:notice] = "#{@user.email} was successfully created."
        else
            msg = ""
            @user.errors.keys.each do |var|
                msg = msg + "#{var} #{@user.errors[var][0]}, "
            end
            flash[:notice] = msg[0..-3]
        end
        redirect_to next_path
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
        @user.update_attribute(:billing_street_address, user_params[:billing_street_address])
        @user.update_attribute(:billing_city, user_params[:billing_city])
        @user.update_attribute(:billing_state, user_params[:billing_state])
        @user.update_attribute(:billing_zip_code, user_params[:billing_zip_code])
        @user.update_attribute(:first_name, user_params[:first_name])
        @user.update_attribute(:last_name, user_params[:last_name])
        @user.update_attribute(:credit_card_number, user_params[:credit_card_number])
        @user.update_attribute(:expiration_date, user_params[:expiration_date])
        @user.update_attribute(:cvv, user_params[:cvv])
        @user.update_attribute(:home_street_address, user_params[:home_street_address])
        @user.update_attribute(:home_city, user_params[:home_city])
        @user.update_attribute(:home_state, user_params[:home_state])
        @user.update_attribute(:home_zip_code, user_params[:home_zip_code])
        @user.update_attribute(:profile_picture, user_params[:profile_picture])
        @user.update_attribute(:personal_description, user_params[:personal_description])
        @user.update_attribute(:house_picture, user_params[:house_picture])
        @user.update_attribute(:house_description, user_params[:house_description])
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
    def show
        @user = User.find params[:id]
        @current_user = current_user
    end
end

