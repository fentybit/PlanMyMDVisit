class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    add_flash_types :error, :notice, :alert

    before_action :logged_in?
    skip_before_action :logged_in?, only: [:home]
    helper_method :current_user, :current_patient, :logged_in?

    def home 
        if logged_in?
            if current_user.admin == true 
                redirect_to admin_users_path 
            end 
            
            redirect_to patient_path(current_patient)
        end 
    end 

    def logged_in? 
        !!current_user
    end 

    private 
    
        def current_user 
            @user = User.find_by(id: session[:user_id])
        end 

        def current_patient 
            @patient = Patient.find_by(user_id: session[:user_id])
        end 
end