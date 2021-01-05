class Patient < ApplicationRecord 
    belongs_to :healthcareprovider 
    belongs_to :user 
    has_many :healthcareteams 
    has_many :doctors, through: :healthcareteams

    def patient_name=(name)
        self.user = User.find_by(name: name)
    end 

    def patient_name 
        self.user ? self.user.fullname : nil 
    end 
end 