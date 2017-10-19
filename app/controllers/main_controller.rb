class MainController < ApplicationController
    def show()
        if session[:username] == nil
            redirect_to new_user_path
        end
    end

    def logout()
        session[:username] = nil
        redirect_to root_path
    end
end
