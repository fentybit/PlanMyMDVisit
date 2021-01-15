class Admin::DoctorsController < ApplicationController
    before_action :set_doctor

    def edit 
    end 

    def update 
        @doctor.update(doctor_params)

        if @doctor.save
            redirect_to admin_user_path(@doctor.user)
        else  
            render :edit 
        end 
    end 

    private 

        def set_doctor
            @doctor = Doctor.find_by(id: params[:id])
        end 

        def doctor_params 
            params.require(:doctor).permit(:user_id, :gender, :specialty, :hospital, :address, :city, :state, :zipcode)
        end   
end