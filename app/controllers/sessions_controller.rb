class SessionsController < ApplicationController
    skip_before_action :logged_in?, only: [:new, :create]

    def new
        @user = User.new 
    end 

    def create 
        @user = User.find_by(username: params[:user][:username])
        
        if @user && @user.authenticate(params[:user][:password])##
            session[:user_id] = @user.id 

            if @user.admin == true 
                redirect_to admin_users_path 
            else 
                current_patient                    
                redirect_to patient_path(current_patient)
            end 
        else  
            flash[:alert] = "Please try again."
            render :new 
        end 
    end 

    def omniauth
        if auth_hash != nil && auth_hash.provider == "google_oauth2"
            @user = User.find_or_create_by_google(auth_hash)
        elsif auth_hash != nil && auth_hash.provider == "github"
            @user = User.find_or_create_by_github(auth_hash)
        end 

        session[:user_id] = @user.id
        @current_patient = Patient.find_or_create_by(user_id: session[:user_id])
    
        # sign up with GitHub and Google
        if current_patient.healthcare_teams.empty?
            redirect_to new_patient_path
        # login with GitHub and Google
        else  
            redirect_to patient_path(current_patient)
        end
    end 

    # user log out
    def destroy 
        session.delete(:user_id)
        flash[:notice] = "Logging out."
        redirect_to '/'
    end 

    private 

        def auth_hash
            request.env['omniauth.auth']
        end 
end