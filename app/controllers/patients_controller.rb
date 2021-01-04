class PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :edit, :update, :destroy]

    def index 
        @patients = Patient.all
    end 

    def new 
        @patient = Patient.new
    end 

    def create 
        @patient = Patient.new(user_params)
        if @patient.save 
            redirect_to patient_path(@patient)
        else  
            redirect_to '/signup'
        end 
    end 

    def show 
    end 

    def edit 
    end 
    
    def update 
        if @patient.update(user_params)
            redirect_to patient_path(@patient)
        else  
            redirect_to edit_patient_path(@patient)
        end 
    end

    def destroy 
        @patient.destroy
    end 

    private 

        def set_user 
            @patient = Patient.find_by(id: params[:id])
        end 

        def user_params 
            params.require(:patient).permit(:medical_record, :test_results, :medications)
        end
end