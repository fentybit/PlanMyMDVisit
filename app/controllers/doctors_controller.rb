class DoctorsController < ApplicationController 
    before_action :set_doctor, only: [:show, :edit, :update, :destroy]

    def index
        if !params[:specialty].blank?
            @doctors = Doctor.by_specialty(params[:specialty])
        else  
            @doctors = Doctor.all
        end 
    end 

    # admin privilege
    def new 
        @doctor = Doctor.new 
    end 

    # admin privilege
    def create
    end 

    # admin privilege
    # patient can only view limited information
    def show
    end 
    
    # admin privilege
    def edit 
    end 
    
    # admin privilege
    def update 
        @doctor.update(doctor_params)

        if @doctor.save
            redirect_to doctor_path(@doctor)
        else  
            render :edit 
        end 
    end 
    
    # admin privilege
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