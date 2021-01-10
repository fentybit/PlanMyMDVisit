class Patient < ApplicationRecord  
    belongs_to :user 
    has_many :healthcare_teams
    has_many :doctors, through: :healthcare_teams

    # accepts_nested_attributes_for :doctors
    # def doctors_attributes=(doctor_attributes)
    #     doctor_attributes.values.each do |doctor_attribute|
    #         doctor = Doctor.find_by(doctor_attribute)
    #         self.doctors << doctor 
    #     end 
    # end 
end 