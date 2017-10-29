class MainController < ApplicationController
    def show
        @user = current_user
    end
    
    def search
        @query = params[:search][:query]
        # if @query
        #     @users = User.search(@query) # NOT YET IMPLEMENTED
        # else
        #     @users = User.all
        # end
        @users = User.where(searchable: true)
        @user = current_user
    end
end
