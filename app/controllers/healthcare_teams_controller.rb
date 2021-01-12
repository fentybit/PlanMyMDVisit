class HealthcareTeamsController < ApplicationController
    before_action :set_healthcareteam, only: [:show, :edit, :update, :destroy]

    def index # admin privilege  ##
        @healthcare_teams = HealthcareTeam.all
    end 

    # patients, doctors and admin
    def new  ##
        @healthcare_team = HealthcareTeam.new

        if params['specialty'] == ""
            flash[:error] = "You must select a specialty."
            redirect_to '/select_specialty'
        else   
            @doctors = Doctor.by_specialty(params['specialty'])
        end
    end 
    
    def create  ##
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

    def show  ##
    end 

    def edit  ##
    end 
    
    def update  ##
        if @healthcare_team.update(healthcareteam_params)
            redirect_to healthcare_team_path(@healthcare_team)
        else  
            redirect_to edit_healthcare_team_path(@healthcare_team)
        end 
    end

    def destroy ##
        @healthcare_team.destroy
        redirect_to healthcareteams_path
    end 

    private 

        def set_healthcareteam ##
            @healthcare_team = HealthcareTeam.find_by(id: params[:id])
        end 

        def healthcareteam_params  ##
            params.require(:healthcare_team).permit(:department, :appointment, :test_result, :treatment_plans, :prescriptions, :billing)
        end
end