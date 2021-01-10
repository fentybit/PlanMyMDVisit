class HealthcareTeamsController < ApplicationController
    before_action :set_healthcareteam, only: [:show, :edit, :update, :destroy]

    def index # admin privilege
        @healthcare_teams = HealthcareTeam.all
    end 

    def new 
        @healthcare_team = HealthcareTeam.new
    end 

    def create 
        @healthcare_team = HealthcareTeam.new(healthcareteam_params)
        if @healthcare_team.save 
            redirect_to healthcare_team_path(@patient)
        else  
            redirect_to '/signup'
        end 
    end 

    def show 
    end 

    def edit 
    end 
    
    def update 
        if @healthcare_team.update(healthcareteam_params)
            redirect_to healthcare_team_path(@healthcare_team)
        else  
            redirect_to edit_healthcare_team_path(@healthcare_team)
        end 
    end

    def destroy 
        @healthcare_team.destroy
        redirect_to healthcareteams_path
    end 

    private 

        def set_healthcareteam
            @healthcare_team = HealthcareTeam.find_by(id: params[:id])
        end 

        def healthcareteam_params 
            params.require(:healthcare_team).permit(:department, :appointment, :test_result, :treatment_plans, :prescriptions, :billing)
        end
end