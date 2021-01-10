class HealthcareTeam < ApplicationRecord 
    belongs_to :patient 
    belongs_to :doctor 

    # validates :department, presence: true 
    # validates :appointment, numericality: { less_than_or_equal_to: Date.today.year }

    # .strftime("%B %d, %Y at %k:%M")
end 