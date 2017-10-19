class MainController < ApplicationController
    def show()
        if session[:username] == nil
            redirect_to new_user_path
        end
    end
end
