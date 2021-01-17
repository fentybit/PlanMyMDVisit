class PatientsController < ApplicationController
 
    def new
        @patient = Patient.new
    end 

    def create
        if current_patient
            current_patient.healthcare_teams.build(doctor_id: params[:patient][:doctor_id], appointment: "2020-12-31 13:05:21", test_result: "Perfectly healthy", treatment_plans: "Maintain current BMI", prescriptions: "None", billing: 0)

            if current_patient.save
                redirect_to patient_path(current_patient)
            else 
                render :new
            end 
        else 
            @patient = Patient.new(patient_params)
            @patient.healthcare_teams.build(doctor_id: params[:patient][:doctor_id], appointment: "2020-12-31 13:05:21", test_result: "Perfectly healthy", treatment_plans: "Maintain current BMI", prescriptions: "None", billing: 0)
        
            if @patient.save 
                redirect_to patient_path(@patient)
            else  
                render :new
            end 
        end 
    end 

    # patient main homepage
    def show  
        @patient = Patient.find_by(id: params[:id])
        
        if @patient != current_patient
            flash[:alert] = "Error URL path."
            redirect_to patient_path(current_patient)
        end 
    end 

    private 

        def patient_params
            params.require(:patient).permit(:user_id, :medical_record, :test_results, :medications)
        end
        
end