class PatientsController < ApplicationController
    before_action :set_patient, only: [:show, :edit, :update, :destroy]
 
    # admin privilege
    # def index  
    #     @patients = Patient.all
    # end 

    def new
        @patient = Patient.new
    end 

    def create
        @patient = Patient.new(patient_params)

        @patient.healthcare_teams.build(doctor_id: params[:patient][:doctor_id], appointment: "2020-12-31 13:05:21", test_result: "Perfectly healthy", treatment_plans: "Maintain current BMI", prescriptions: "None", billing: 0)
        
        if @patient.save 
            redirect_to patient_path(current_patient)
        else  
            render :new
        end 
    end 

    # patient main homepage
    def show  
        if @patient != current_patient
            flash[:alert] = "Error URL path."
            redirect_to patient_path(current_patient)
        end 
    end 

    # admin privilege
    def edit
    end 
    
    # admin privilege
    def update
        @patient.update(patient_params)

        if @patient.save
            redirect_to patient_path(@patient)
        else  
            render :edit
        end 
    end
    
    # admin privilege
    def destroy 
        @patient.destroy
        flash[:notice] = "Patient deleted."
        redirect_to patients_path
    end 

    private 

        def set_patient
            @patient = Patient.find_by(id: params[:id])
        end 

        def patient_params
            params.require(:patient).permit(:user_id, :medical_record, :test_results, :medications)
        end
end