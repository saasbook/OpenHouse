class MainController < ApplicationController
    before_action do
        @user = current_user
    end
    
    def show
    end
    
    def search
        @full_location = params[:location][:search]
        @all_users = User.where(:searchable => true)
        
        @success = googleSearch
        if @success == false
            flash[:alert] = "Your location does not exist, so check out Oakland instead :)"
        end
        
        #Populate array of nearby homes to populate the map
        @nearby_locations = []
        @users = []
        
        @nearby = populateMap()
        if @nearby == false
            flash[:alert] = "No spaces were found nearby. Zoom out with the map to find the closest spaces. If you want to learn more about those spaces, perform a new search on that city."
        end
    end
    
    def us
    end
    
    def about
    end
end
