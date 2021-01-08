class Patient < ApplicationRecord 
    belongs_to :healthcareprovider 
    belongs_to :user 
    has_many :healthcareteams 
    has_many :doctors, through: :healthcareteams

    def fullname=(name)
        self.user = User.find_by(name: name)
    end 

    def fullname 
        self.user ? self.user.fullname : nil 
    end 
end 