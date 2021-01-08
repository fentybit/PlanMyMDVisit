class User < ApplicationRecord 
    has_secure_password
    
    has_many :patients
    has_many :doctors

    before_validation :capitalized_name

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true
    validates :firstname, presence: true, format: { without: /[0-9]/, message: "Numbers are not allowed." }
    validates :lastname, presence: true, format: { without: /[0-9]/, message: "Numbers are not allowed." }
    # validates :phone_number, length: { is: 10 }

    def fullname 
        self.firstname + " " + self.lastname
    end 

    def capitalized_name 
        self.firstname = self.firstname.capitalize
        self.lastname = self.lastname.capitalize
    end 
end 