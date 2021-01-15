class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            
            # user as a patient
            if @user.admin == false 
                redirect_to new_patient_path
            # user as an admin
            else  
                redirect_to admin_users_path
            end 
        else  
            render :new
        end 
    end 

    def show 
        if @user != current_user 
            flash[:alert] = "Error URL path."
            redirect_to user_path(current_user)
        end 
    end 

    def edit
        if @user != current_user 
            flash[:alert] = "Error URL path."
            redirect_to edit_user_path(current_user)
        end 
    end 
    
    def update
        @user.update(user_params)

        if @user.save
            redirect_to user_path(@user)
        else  
            render :edit
        end 
    end

    # user as patient can delete their own profile
    def destroy
        @user.destroy
        current_patient.destroy
        session.clear
        flash[:notice] = "User deleted, and logging out."
        redirect_to '/'
    end 

    private 

        def set_user
            @user = User.find_by(id: params[:id])
        end 

        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation, :firstname, :lastname, :admin)
        end
end