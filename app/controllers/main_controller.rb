class MainController < ApplicationController
    def logged_in?
        return session[:username] != nil
    end

    def show
    end

    def logout
        session[:username] = nil
    end

    def login_page
        if logged_in?
            redirect_to root_path
        end
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
        @users = User.all
    end
end
