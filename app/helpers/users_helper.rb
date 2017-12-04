# Helper functions relating to users

module UsersHelper
  def update_user_fields
    unless params[:amenity_list].nil?		
        @user.amenity_list.update_attributes(amenity_params)		
        @user.amenity_list.save!		
    end
    unless user_params[:available_time_start].nil?
      if user_params[:available_time_start].include?("-") or user_params[:available_time_end].include?("-") or user_params[:available_time_start] == nil or user_params[:available_time_end] == nil or user_params[:available_time_start] == "" or user_params[:available_time_end] == "" 
          flash[:notice] = "The input time was invalid."
          params[:user].each do |key, value|
            flash[key] = value
          end
          redirect_to :back
          return
      end
    end
    ## byebug
    
    @user.update_attributes(user_params)
    @user.save!
    flash[:notice] = "Your account has been updated."
  end
end