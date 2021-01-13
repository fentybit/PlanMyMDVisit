class User < ApplicationRecord 
    has_secure_password
    
    has_many :patients
    has_many :doctors

    before_validation :capitalized_name

    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true, uniqueness: true
    validates :firstname, presence: true, format: { without: /[0-9]/, message: "Numbers are not allowed." }
    validates :lastname, presence: true, format: { without: /[0-9]/, message: "Numbers are not allowed." }

    def fullname 
        self.firstname + " " + self.lastname
    end 

    def capitalized_name 
        self.firstname = self.firstname.titleize
        self.lastname = self.lastname.titleize
    end 

    def self.find_or_create_from_auth_hash(auth_hash)
        @user = User.find_by(username: auth_hash.uid)

        if @user   
            @user 
        else 
            @user = User.create(firstname: auth_hash["info"].name.split[0], lastname: auth_hash["info"].name.split[1], username: auth_hash.uid, email: auth_hash["info"].name.split.join.downcase + "@me.com", password: SecureRandom.hex)
        end 
    end 
end 