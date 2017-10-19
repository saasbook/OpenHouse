class MainController < ApplicationController
    def show()
        puts session[:username]  == nil
        if session[:username] != nil
            render 'main/show'
        else
            redirect_to new_user_path
        end
    end
end
