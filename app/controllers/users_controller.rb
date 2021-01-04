class UsersController < ApplicationController
    def index 
    end 

    def new 
    end 

    def create 
    end 

    def show 
    end 

    def destroy 
    end 

    private 

        def user_params 
            params.require(:user).permit!
        end
end