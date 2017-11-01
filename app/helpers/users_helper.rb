module UsersHelper
    def update_picture(type)
        if params[:user][type] != nil
            if not params[:user][type].content_type =~ /^image\//
                flash[:notice] = "You must choose an image file."
                redirect_to request.referrer and return true
            end
            File.open(Rails.root.join('app', 'assets', 'images', 'user_images', @user.email, "#{type.to_s}.jpg"), 'wb') do |file|
                file.write(params[:user][type].read)
            end
            flash[:notice] = "Your picture has been updated."
            redirect_to request.referrer and return true
        end
        return false
    end
end
