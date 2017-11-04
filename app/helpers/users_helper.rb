module UsersHelper
  def update_picture(type)
    if params[:user].nil?
      flash[:notice] = 'Please select an image first.'
      redirect_to request.referrer || root_path and return true
    end
    image = params[:user][type]
    if !image.nil?
      if !(image.content_type =~ /^image\//)
        flash[:notice] = 'You must choose an image file.'
        redirect_to request.referrer || root_path and return true
      end
      File.open(Rails.root.join('app', 'assets', 'images', 'user_images',
                @user.email, "#{type}.jpg"), 'wb') do |file|
        file.write(image.read)
      end
      flash[:notice] = 'Your picture has been updated.'
      redirect_to request.referrer and return true
    end
    false
  end
end
