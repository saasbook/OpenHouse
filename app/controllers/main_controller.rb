class MainController < ApplicationController
    def logged_in?
        return session[:username] != nil
    end

    def show
        if not logged_in?
            redirect_to login_page_path
        end
    end

    def logout
        session[:username] = nil
    end

    def login_page
        if logged_in?
            redirect_to root_path
        end
    end

    def login
        if params[:username] != nil
            session[:username] = params[:username]
        end
        redirect_to root_path
    end
end
