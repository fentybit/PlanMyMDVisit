class Admin::UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

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
        @user.update(user_params)

        if @user.save
            redirect_to admin_user_path(@user)
        else  
            render :edit
        end 
    end 

    def destroy
        @patient = @user.patient 
        @doctor = @user.doctor 
        
        if !@patient.nil?
            @user.destroy
            @patient.destroy
        else
            @user.destroy
            @doctor.destroy
        end 

        flash[:notice] = "User deleted."
        redirect_to admin_users_path
    end 

    private 

        def set_user
            @user = User.find_by(id: params[:id])
        end 

        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation, :firstname, :lastname, :admin)
        end
    
end