class Admin::HealthcareTeamsController < ApplicationController
    before_action :set_healthcareteam

    def edit 
    end 

    def update 
        @healthcare_team.update(healthcareteam_params)

        if @healthcare_team.save
            render :edit
        else  
            render :edit
        end 
    end 

    def destroy
        @user = User.find_by(id: params[:user_id])
        if @user 
            @healthcare_team.destroy
            flash[:notice] = "Care Team deleted."
            redirect_to admin_user_path(@user)
        else
            flash[:notice] = "Invalid URL path."
            redirect_to admin_users_path
        end 
    end 

    private 

        def set_healthcareteam 
            @healthcare_team = HealthcareTeam.find_by(id: params[:id])
        end 

        def healthcareteam_params
            params.require(:healthcare_team).permit(:department, :appointment, :test_result, :treatment_plans, :prescriptions, :billing)
        end

end