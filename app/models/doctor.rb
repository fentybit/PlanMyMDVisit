class Doctor < ApplicationRecord 
    belongs_to :user 
    has_many :healthcare_teams 
    has_many :patients, through: :healthcare_teams 

    # validates :title, presence: true, inclusion: { in: ["Dentist", "Cardiologist"] }

    def fullname 
        self.user ? self.user.fullname : nil 
    end 
end 