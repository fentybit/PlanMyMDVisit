class HealthcareTeamsController < ApplicationController

    def index
        if params[:patient_id]
            @patient = Patient.find_by(id: params[:patient_id])
            if @patient.nil? || @patient != current_patient
                flash[:alert] = "Error URL path."
                redirect_to patient_path(current_patient)
            else  
                @healthcare_teams = @patient.healthcare_teams
            end 
        else
            @healthcare_teams = HealthcareTeam.all
        end 
    end 

    # patient to initiate and admin to edit healthcare_team attributes
    def new 
        @healthcare_team = HealthcareTeam.new
        @patient = Patient.find_by(id: params[:patient_id])
        
        if params['specialty'] == ""
            flash[:error] = "You must select a specialty."
            redirect_to select_specialty_path
        elsif @patient.nil? || @patient != current_patient  
            flash[:alert] = "Error URL path."
            redirect_to select_specialty_path
        else   
            @doctors = Doctor.by_specialty(params['specialty'])
        end
    end 
    
    def create 
        if params["healthcare_team"]["doctor_id"] == "" || params["healthcare_team"]["appointment"] == ""
            flash[:error] = "Please select doctor and appointment time."
            redirect_to select_specialty_path 
        else  
            @healthcare_team = current_patient.healthcare_teams.build(healthcareteam_params)
            @healthcare_team.doctor = Doctor.find_by(id: params["healthcare_team"]["doctor_id"])
          
            if @healthcare_team.save 
                redirect_to patient_healthcare_team_path(current_patient, @healthcare_team)
            else  
                redirect_to patient_path(current_patient)
            end 
        end 
    end 

    def show 
        if params[:patient_id]
            @patient = Patient.find_by(id: params[:patient_id])
            if @patient.nil? || @patient != current_patient
                flash[:alert] = "Error URL path."
                redirect_to patient_path(current_patient)
            else 
                @healthcare_team = @patient.healthcare_teams.find_by(id: params[:id])

                if @healthcare_team.nil?
                    flash[:alert] = "Care Team not found."
                    redirect_to patient_healthcare_teams_path(@patient)
                end 
            end 
        else  
            @healthcare_team = HealthcareTeam.find(params[:id])
        end 
    end 

    private 

        def healthcareteam_params
            params.require(:healthcare_team).permit(:department, :appointment, :test_result, :treatment_plans, :prescriptions, :billing)
        end
end 