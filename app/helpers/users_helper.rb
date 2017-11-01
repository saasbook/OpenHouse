module UsersHelper
    def update_picture(type)
        puts params
        puts params[:user]
        puts type
        puts params[:user][type]
        if params[:user][type] != nil
            File.open(Rails.root.join('app', 'assets', 'images', 'user_images', @user.email, "#{type.to_s}.jpg"), 'wb') do |file|
                file.write(params[:user][type].read)
            end
            flash[:notice] = "Your picture has been updated."
            redirect_to edit_user_path
            return true
        end
        return false
    end

    def update_billing
        @user = current_user
        @user.update_attribute(:billing_street_address, user_params[:billing_street_address])
        @user.update_attribute(:billing_city, user_params[:billing_city])
        @user.update_attribute(:billing_state, user_params[:billing_state])
        @user.update_attribute(:billing_zip_code, user_params[:billing_zip_code])
        @user.update_attribute(:billing_first_name, user_params[:billing_first_name])
        @user.update_attribute(:billing_last_name, user_params[:billing_last_name])
        @user.update_attribute(:credit_card_number, user_params[:credit_card_number])
        @user.update_attribute(:expiration_date, user_params[:expiration_date])
        @user.update_attribute(:cvv, user_params[:cvv])
        @user.save
        flash[:notice] = "#{@user.email}\'s billing information has been added."
        redirect_to new_user_host_path
    end
    
end
