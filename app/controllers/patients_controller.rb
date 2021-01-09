class PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :edit, :update, :destroy]

    def index 
        @patients = Patient.all
    end 

    def new 
        @patient = Patient.new
    end 

    def create 
        @patient = Patient.new(patient_params)
        # 3.times { @song.notes.build } --> similar ideas with pre-build healthcare conditions
        if @patient.save 
            redirect_to user_patient_path(current_user, @patient.id)
        else  
            render :new
        end 
    end 

    def show 
    end 

    def edit 
    end 
    
    def update 
        if @patient.update(patient_params)
            redirect_to patient_path(@patient)
        else  
            redirect_to edit_patient_path(@patient)
        end 
    end

    def destroy 
        @patient.destroy
        redirect_to patients_path
    end 

    private 
        def set_user 
            @user = User.find_by(id: params[:user_id])
        end 

        def set_patient
            @patient = Patient.find_by(id: params[:id])
        end 

        def patient_params 
            params.require(:patient).permit(:user_id, :medical_record, :test_results, :medications, :doctor_ids)
        end
end