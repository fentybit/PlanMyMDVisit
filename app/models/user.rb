class User < ApplicationRecord 
    has_many :patients
    has_many :doctors
    
    has_secure_password 
end 