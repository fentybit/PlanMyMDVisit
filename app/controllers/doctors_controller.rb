class DoctorsController < ApplicationController 
    before_action :set_doctor, only: [:show, :edit, :update, :destroy]

    def index
        if !params[:specialty].blank?
            @doctors = Doctor.by_specialty(params[:specialty])
        else  
            @doctors = Doctor.all
        end 
    end 

    # admin + doctor privilege
    def new 
        @doctor = Doctor.new 
    end 

    # admin + doctor privilege
    def create
    end 

    # admin + doctor privilege
    # patient can only view limited information
    def show
    end 
    
    # admin + doctor privilege
    def destroy 
        @doctor.destroy
        redirect_to doctors_path
    end 

    private 

        def set_doctor
            @doctor = Doctor.find_by(id: params[:id])
        end 
end 