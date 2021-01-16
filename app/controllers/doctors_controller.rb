class DoctorsController < ApplicationController 

    def index
        if !params[:specialty].blank?
            @doctors = Doctor.by_specialty(params[:specialty])
        else  
            @doctors = Doctor.all
        end 
    end 

    # admin privilege
    # patient can only view limited Doctor's information
    def show
        @doctor = Doctor.find_by(id: params[:id])
    end 

end 