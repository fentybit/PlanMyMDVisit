class Doctor < ApplicationRecord 
    belongs_to :user 
    has_many :healthcare_teams 
    has_many :patients, through: :healthcare_teams 

    scope :general_practice, -> { where(specialty: "General Practice") }

    # validates :title, presence: true, inclusion: { in: ["Dentist", "Cardiologist"] }

    def fullname 
        self.user ? self.user.fullname : nil 
    end 

    def self.family_medicine 
        where(specialty: "Family Medicine")
    end 
end 