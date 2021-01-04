class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index 
        @users = User.all
    end 

    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            redirect_to user_path(@user)
        else  
            redirect_to '/signup'
        end 
    end 

    def show 
    end 

    def edit 
    end 
    
    def update 
        if @user.update(user_params)
            redirect_to user_path(@user)
        else  
            redirect_to edit_user_path(@user)
        end 
    end

    def destroy 
    end 

    private 
        def set_user 
            @user = User.find_by(id: params[:id])
        end 

        def user_params 
            params.require(:user).permit(:username, :email, :password_digest, :firstname, :lastname)
        end
end