class MainController < ApplicationController
    def create()
        redirect_to users_path
    end
    def show()
        render 'main/show'
    end
end
