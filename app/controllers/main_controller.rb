class MainController < ApplicationController
    def show
        @user = current_user
    end
    
    def search
        if params[:search] == nil
            params[:search] = {query: ""}
        end
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
