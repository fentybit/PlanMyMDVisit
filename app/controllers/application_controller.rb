class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    # before_action :logged_in?
    helper_method :current_user, :current_patient, :logged_in?

    def home 
        if current_user
            @patient = Patient.find_by(user_id: current_user.id)
        end 
    end 

    def current_user 
        @user = User.find_by(id: session[:user_id])
    end 

    def logged_in? 
        !!current_user
    end 

    def current_patient 
        @patient = Patient.find_by(user_id: current_user.id)
    end 
end