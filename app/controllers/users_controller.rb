class UsersController < ApplicationController
    def index
        redirect_to new_user_path
    end

    def create
    end
    
    def new
    end
end
