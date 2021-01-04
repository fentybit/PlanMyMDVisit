class User < ApplicationRecord 
    has_secure_password
    
    has_many :patients
    has_many :doctors
end 