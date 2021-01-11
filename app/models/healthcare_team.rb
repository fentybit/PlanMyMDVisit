class HealthcareTeam < ApplicationRecord 
    belongs_to :patient 
    belongs_to :doctor 

    # validates :department, presence: true 
    # validates :appointment, numericality: { less_than_or_equal_to: Date.today.year }

    # .strftime("%B %d, %Y at %k:%M")
    # def date_time_not_in_past
    #     if self.appointment <= DateTime.now
    #         errors.add('Appointment time can not in the past')
    #     end 
    # end 
end 