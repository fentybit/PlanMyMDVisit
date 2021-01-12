class HealthcareTeam < ApplicationRecord 
    belongs_to :patient 
    belongs_to :doctor 

    def doctor_specialty 
        self.doctor ? self.doctor.specialty : nil 
    end 

    def doctor_fullname
        self.doctor ? self.doctor.fullname : nil 
    end 

    def doctor_hospital
        self.doctor ? self.doctor.hospital : nil 
    end 
end 