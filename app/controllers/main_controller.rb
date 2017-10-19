class MainController < ApplicationController
    def show()
        puts session[:username]  == nil
        if session[:username] != nil
            render 'main/show'
        else
            redirect_to 'users/create'
        end
    end
end
