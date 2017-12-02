class MainController < ApplicationController
    before_action :current_user
    
    def show
        @user = current_user
    end
    
    def search
        @full_location = params[:location][:search]
        
        # Cheesing our way into getting search results since 2017
        @all_users = User.where(:searchable => true)
        
        result = Geocoder.search(@full_location)[0]
        if result != nil
            @curr_loc_lat = result.geometry['location']['lat']
            @curr_loc_lng = result.geometry['location']['lng']
            @success = true
        else
            # If an error occurs, set default to Oakland
            @success = false
            flash[:notice] = "Your location does not exist, so check out Oakland instead :)"
            @full_location = "Oakland, CA"
            @curr_loc_lat = 37.8044 
            @curr_loc_lng = 122.2711
        end
        
        #Populate array of nearby homes to populate the map
        @nearby_locations = []
        @users = []
        
        @all_users.near(@full_location).each do |user|
            @users.push(user)
            url = request.base_url + "/users/" + user.id.to_s
            @nearby_locations.push([user.latitude, user.longitude, user.price, user.home_street_address, url])
        end
        
        if @nearby_locations == []
            @nearby = "false"
            flash[:notice] = "No spaces were found nearby. Zoom out with the map to find the closest spaces. If you want to learn more about those spaces, perform a new search on that city."
            @all_users.each do |user|
                url = request.base_url + "/users/" + user.id.to_s
                @nearby_locations.push([user.latitude, user.longitude, user.price, user.home_street_address, url])
            end
        else
            @nearby = "true"
        end

        @user = current_user
    end
    
    def us
        @user = current_user
    end
    
    def about
        @user = current_user
    end
end
