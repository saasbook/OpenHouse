module UsersHelper
    def update_picture(type)
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
end
