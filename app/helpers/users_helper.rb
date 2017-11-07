# Helper functions relating to users
module UsersHelper
  def update_picture(type)
    if params[:user].nil?
      flash[:notice] = 'Please select an image first.'
      redirect_to request.referrer || root_path and return true
    end
    image = params[:user][type]
    unless image.nil?
      unless image.content_type =~ %r{^image\/}
        flash[:notice] = 'You must choose an image file.'
        redirect_to request.referrer || root_path and return true
      end
      
      delete_picture(type)
      
      File.open(Rails.root.join('app', 'assets', 'images', 'user_images',
                                @user.email, image.original_filename), 'wb') do |file|
        file.write(image.read)
        params[:user][type] = image.original_filename
      end
      flash[:notice] = 'Your picture has been updated.'
      redirect_to request.referrer and return true
    end
    false
  end
  
  # Dependent on being called only by :profile_picture and :house_picture
  def delete_picture(type)
      if (type == :profile_picture)
        old_picture_name = @user.profile_picture
        @user.profile_picture = nil
      else
        old_picture_name = @user.house_picture
        @user.house_picture = nil
      end
      if old_picture_name and File.exists? Rails.root.join('app', 'assets', 'images', 'user_images', @user.email, old_picture_name)
        File.delete Rails.root.join('app', 'assets', 'images', 'user_images', @user.email, old_picture_name)
      end
  end
  
end
