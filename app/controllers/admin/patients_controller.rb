class Admin::PatientsController < ApplicationController
    before_action :set_patient 

    def edit 
    end 
    
    def update 
        @patient.update(patient_params)
    
        if @patient.save
            redirect_to admin_user_path(@patient.user)
        else  
            render :edit
        end 
    end 

    private 

        def set_patient
            @patient = Patient.find_by(id: params[:id])
        end 

        def patient_params
            params.require(:patient).permit(:user_id, :medical_record, :test_results, :medications)
        end

end