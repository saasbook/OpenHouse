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
            redirect_to request.referrer
            return true
        end
        return false
    end
end
