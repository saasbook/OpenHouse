class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name, :billing_street_address, :billing_city, :billing_state, :billing_zip_code, :billing_first_name, :billing_last_name, :credit_card_number, :expiration_date, :cvv, :home_street_address, :home_city, :home_state, :home_zip_code, :personal_description, :house_description, :searchable, :price, :available_time_start, :available_time_end, :title, :capacity)
    end

    def amenity_params
        params.require(:amenity_list).permit(:wifi, :coffee, :computer_desk, :printer, :projector, :microwave, :kitchen_access, :tv_screen, :outdoor_space, :piano, :art_space, :garage)
    end

    def new
    end
    
    def create
        @user = User.create(user_params)
        @user.amenity_list = AmenityList.new
        next_path = new_user_path
        if @user.errors.empty?
            path = Rails.root.join('app', 'assets', 'images', 'user_images', @user.email)
            Dir.mkdir path unless File.exists? path
            next_path = new_user_billing_path
            log_in @user
            flash[:notice] = "#{@user.email} was successfully created."
        else
            msg = ""
            @user.errors.keys.each do |var|
                msg = msg + "#{var} #{@user.errors[var][0]}, "
            end
            flash[:notice] = msg[0..-3]
            flash[:email] = @user.email
            flash[:first_name] = @user.first_name
            flash[:last_name] = @user.last_name
            flash[:personal_description] = @user.personal_description
        end
        redirect_to next_path
    end
    
    def new_billing
        @user = current_user
    end
    
    def new_host
        @user = current_user
    end
    
    def edit
        @user = current_user
    end
    
    def update_billing
        @user = current_user
        update_user_fields and redirect_to new_user_host_path
    end

    def update_host
        @user = current_user
        update_user_fields and redirect_to skip_path
    end

    def update
        @user = current_user
        update_user_fields and redirect_to user_path(@user)
    end
    
    def destroy
        @user = current_user
        log_out
        @user.destroy
        
        # Remove image files associated with @user
        if File.exists? Rails.root.join('app', 'assets', 'images', 'user_images', @user.email)
            FileUtils.rm_rf Rails.root.join('app', 'assets', 'images', 'user_images', @user.email)
        end
        
        flash[:notice] = "Your account has been deleted."
        redirect_to root_path
    end

    def show
        @user = User.find params[:id]
        @current_user = current_user
        @full_location = @user.home_street_address + " " + @user.home_city + " " + @user.home_state
        
        result = Geocoder.search(@full_location)[0]
        if result == nil
            @full_location = "Oakland, CA"
            @success = false
            result = Geocoder.search(@full_location)[0]
        end
        @curr_loc_lat = result.geometry['location']['lat']
        @curr_loc_lng = result.geometry['location']['lng']
    end
    
    def skip
        @user = current_user
        flash[:notice] = "Your account has been created."
        redirect_to user_path(@user)
    end
    
    def update_profile_picture
        @user = current_user
        
        puts("I like hedgehogs")
        
        if params[:image_id].present?
            puts("pie")
            preloaded = Cloudinary::PreloadedFile.new(params[:image_id])         
            raise "Invalid upload signature" if !preloaded.valid?
            
            # Delete previous picture if it exists
            if @user.cloud_profile_picture_id
                Cloudinary::Uploader.destroy(@user.cloud_profile_picture_id)
            end
            @user.cloud_profile_picture_id = preloaded.identifier
            puts(@user.cloud_profile_picture_id)
            @user.save!
        end
        redirect_to request.referrer
    end
    
    def update_house_picture
         @user = current_user
        
        if params[:image_id].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:image_id])         
            raise "Invalid upload signature" if !preloaded.valid?
            
            # Delete previous picture if it exists
            if @user.cloud_house_picture_id
                Cloudinary::Uploader.destroy(@user.cloud_house_picture_id)
            end
            @user.cloud_house_picture_id = preloaded.identifier
            puts(@user.cloud_house_picture_id)
            @user.save!
        end
        redirect_to request.referrer
    end
    
    def update_multiple_pictures
        @user = current_user
        
        if params[:image_id].present?
            preloaded = Cloudinary::PreloadedFile.new(params[:image_id])         
            raise "Invalid upload signature" if !preloaded.valid?
            
            @user.cloud_house_image_ids.push(preloaded.identifier)
            #@user.cloud_profile_picture_id = preloaded.identifier
            #puts(@user.cloud_profile_picture_id)
            @user.save!
        end
        puts(@user.cloud_house_image_ids)
        redirect_to request.referrer
    end
end
