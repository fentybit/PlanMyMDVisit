class HealthcareTeam < ApplicationRecord 
    belongs_to :healthcareprovider 
    belongs_to :patient 
    belongs_to :doctor 
end 