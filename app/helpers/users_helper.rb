# Helper functions relating to users
module UsersHelper
  
  def no_user
    flash[:notice] = 'Please select an image first.'
    redirect_to request.referrer || root_path and return true
  end
  
  def unsuccessful_update
    flash[:notice] = 'You must choose an image file.'
    redirect_to request.referrer || root_path and return true
  end
  
  def successful_update(type)
    File.open(Rails.root.join('app', 'assets', 'images', 'user_images',
                                @user.email, "#{type}.jpg"), 'wb') do |file|
      file.write(image.read)
    end
    flash[:notice] = 'Your picture has been updated.'
    redirect_to request.referrer and return true
  end
  
  def update_image_given(type)
    image = params[:user][type]
    unless image.nil?
      unless image.content_type =~ %r{^image\/}
        unsuccessful_update
      end
      successful_update(type)
    end
  end
  
  def update_picture(type)
    if params[:user].nil?
      no_user
    else
      update_image_given(type)
      false
    end
  end
end
