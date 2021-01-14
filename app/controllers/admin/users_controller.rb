class Admin::UsersController < ApplicationController

    def index 
        if !params[:users_type].blank?
            if params[:users_type] == "Patients"
                @users = User.patients
            elsif params[:users_type] == "Doctors"
                @users = User.doctors
            end 
        else  
            @users = User.all.order(firstname: :asc)
        end 
    end 

    def show 
        @user = User.find_by(id: params[:id])
    end 

    def edit 
    end 

    def update 
    end 
end