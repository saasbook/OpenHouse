module SearchHelper
    def googleSearch
        result = Geocoder.search(@full_location)[0]
        if result != nil
            @curr_loc_lat = result.geometry['location']['lat']
            @curr_loc_lng = result.geometry['location']['lng']
            true
        else
            # If an error occurs, set default to Oakland
            @full_location = "Oakland, CA"
            @curr_loc_lat = 37.8044 
            @curr_loc_lng = 122.2711
            false
        end
    end
    
    def populateMap()
        all_users = User.where(:searchable => true)
        all_users.near(@full_location).each do |user|
            @users.push(user)
            url = request.base_url + "/users/" + user.id.to_s
            @nearby_locations.push([user.latitude, user.longitude, user.price, user.home_street_address, url])
        end
        
        return true unless @nearby_locations == []
            all_users.each do |user|
                url = request.base_url + "/users/" + user.id.to_s
                @nearby_locations.push([user.latitude, user.longitude, user.price, user.home_street_address, url])
            end
            false
    end
end