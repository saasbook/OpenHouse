class MainController < ApplicationController
    def show
        @user = current_user
    end
    
    def search
        @address = params[:location][:address]
        @city = params[:location][:city]
        @state = params[:location][:state]
        @users = User.where (first_name : "Vinsen")
        @user = current_user
    end
end
