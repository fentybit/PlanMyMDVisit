class Patient < ApplicationRecord  
    belongs_to :user 
    has_many :healthcare_teams
    has_many :doctors, through: :healthcare_teams

    def fullname 
        self.user ? self.user.fullname : nil 
    end 
end 