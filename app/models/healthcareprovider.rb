class HealthcareProvider < ApplicationRecord 
    has_many :patients
    has_many :doctors 
    has_many :healthcareteams
end 