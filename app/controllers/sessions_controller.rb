class SessionsController < ApplicationController

    def new 
        @user = User.new 
    end 

    def create 
        if auth_hash != nil 
            @user = User.find_or_create_from_auth_hash(auth_hash)
            session[:user_id] = @user.id
            @patient = Patient.find_or_create_by(user_id: @user.id)
            redirect_to patient_path(@patient)
        else  
            @user = User.find_by(username: params[:user][:username])
            
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id 
                current_patient
                
                redirect_to patient_path(current_patient)
            else  
                flash[:alert] = "Please try again."
                render :new 
            end 
        end 
    end 

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end 

    private 

        def auth_hash
            request.env['omniauth.auth']
        end 
end