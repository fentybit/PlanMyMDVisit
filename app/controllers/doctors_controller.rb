class DoctorsController < ApplicationController 
    before_action :set_doctor, only: [:show, :edit, :update, :destroy]

    def index 
        @doctors = Doctor.all
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