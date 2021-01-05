class User < ApplicationRecord 
    has_secure_password
    
    has_many :patients
    has_many :doctors

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true
    validates :firstname, presence: true, format: { without: /[0-9]/, message: "Numbers are not allowed." }
    validates :lastname, presence: true, format: { without: /[0-9]/, message: "Numbers are not allowed." }
    validates :password_digest, length: { in: 6..20 }
    # validates :phone_number, length: { is: 10 }

    def full_name 
        self.first_name + " " + self.last_name
    end 
end 