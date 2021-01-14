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

    def start_time
        self.appointment.start
        ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end

    private 

        def date_range
        beginning = start_date.beginning_of_week + 1.day
        ending    = start_date.end_of_week - 1.day
        (beginning..ending).to_a
        end
end 