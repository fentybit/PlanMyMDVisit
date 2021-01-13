class DoctorsController < ApplicationController 
    before_action :set_doctor, only: [:show, :edit, :update, :destroy]

    def index
        if !params[:specialty].blank?
            @doctors = Doctor.by_specialty(params[:specialty])
        else  
            @doctors = Doctor.all
        end 
    end 

    # doctor privilege
    def new 
        @doctor = Doctor.new 
    end 

    # doctor privilege
    def create
    end 

    # doctor privilege
    # patient can only view limited information
    def show
    end 
    
    # doctor privilege
    def edit 
    end 
    
    # doctor privilege
    def update 
        @doctor.update(doctor_params)

        if @doctor.save
            redirect_to doctor_path(@doctor)
        else  
            render :edit 
        end 
    end 
    
    # doctor privilege
    def destroy 
        @doctor.destroy
        flash[:notice] = "Doctor deleted."
        redirect_to doctors_path
    end 

    private 

        def set_doctor
            @doctor = Doctor.find_by(id: params[:id])
        end 

        def doctor_params 
        end 
end 