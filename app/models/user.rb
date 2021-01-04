class User < ApplicationRecord 
    has_secure_password
    
    has_many :patients
    has_many :doctors

    def full_name 
        self.first_name + " " + self.last_name
    end 
end 