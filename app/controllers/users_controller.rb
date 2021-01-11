class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # def index 
    #     @users = User.all
    # end 

    def new 
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            # for user as a patient
            if @user.admin == false 
                redirect_to new_user_patient_path(@user)
            else  
                redirect_to user_doctor_path(@user) # need to debug
            end 
        else  
            render :new
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
        @user.destroy
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