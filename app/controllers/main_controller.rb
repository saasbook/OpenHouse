class MainController < ApplicationController
    def show
        @user = current_user
    end
    
    def search
        @address = params[:location][:address]
        @city = params[:location][:city]
        @state = params[:location][:state]
        @users = User.all([:home_street_address => @address, :home_city => @city, :home_state => @state]).where(:searchable => true)
        # @users = @users.sort MAKE SEARCH FUNCTION BASED OFF OF DISTANCE W/GOOGLE MAPS API
        @user = current_user
    end
end
