class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index 
        @users = User.all 
        @patients = Patient.all
        @doctors = Doctor.all 
    end 

    

    private 

        def set_user
            @user = User.find_by(id: params[:id])
        end 

        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation, :firstname, :lastname, :admin)
        end
end