class Patient < ApplicationRecord  
    belongs_to :user 
    has_many :healthcare_teams
    has_many :doctors, through: :healthcare_teams

    # accepts_nested_attributes_for :doctors
end 