class SessionsController < ApplicationController
    def new 
        @user = User.new 
    end 

    def create 
        @user = User.find_by(username: params[:user][:username])
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            @patient = Patient.find_by(user_id: @user.id)
            redirect_to user_patient_path(@user, @patient)
        else  
            flash[:alert] = "Please try again."
            render :new 
        end 
    end 

    def destroy 
        session.delete :user_id 
        redirect_to '/'
    end 
end