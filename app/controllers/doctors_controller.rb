class DoctorsController < ApplicationController 
    before_action :set_doctor, only: [:show, :edit, :update, :destroy]

    def index 
        if !params[:specialty].blank?
            @doctors = Doctor.by_specialty(params[:specialty])
        else  
            @doctors = Doctor.all
        end 
    end 

    def new 
        @doctor = Doctor.new 
    end 

    def create
        # need to log in as admin    
    end 

    def show 
    end 

    private 

        def set_doctor
            @doctor = Doctor.find_by(id: params[:id])
        end 
end 