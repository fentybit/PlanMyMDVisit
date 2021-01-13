class Doctor < ApplicationRecord 
    belongs_to :user 
    has_many :healthcare_teams 
    has_many :patients, through: :healthcare_teams 

    scope :general_practice, -> { where(specialty: "General Practice") }

    def fullname 
        self.user ? self.user.fullname : nil 
    end 

    def self.family_medicine 
        where(specialty: "Family Medicine")
    end 

    def self.specialties
        select(:specialty).distinct.order(specialty: :asc)
    end 

    def self.by_specialty(specialty)
        where(specialty: specialty)
    end 
end 