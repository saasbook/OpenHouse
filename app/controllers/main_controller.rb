class MainController < ApplicationController
    def show
        @user = current_user
    end
    
    def search
        @address = params[:location][:address]
        @city = params[:location][:city]
        @state = params[:location][:state]
        @users = User.all
        @user = current_user
    end
end
