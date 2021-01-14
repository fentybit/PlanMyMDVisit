class Admin::UsersController < ApplicationController
    # before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index 
        if !params[:users_type].blank?
            if params[:users_type] == "Patients"
                @users = Patient.all # need to sort alphabetically
            elsif params[:users_type] == "Doctors"
                @users = Doctor.all # need to sort alphabetically
            end 
        else  
            @users = User.all.order(firstname: :asc)
        end 
    end 

    def show 
        @user = User.find_by(id: params[:id])
        @patient = Patient.find_by(user_id: params[:id])
        @doctor = Doctor.find_by(user_id: params[:id])
    end 

    def edit 
    end 

    def update 
    end 
end