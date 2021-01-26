class User < ApplicationRecord 
    has_secure_password
    
    has_one :patient
    has_one :doctor

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

    def self.patients 
        joins(:patient) # for postgres
        # joins(:patient).where("user_id") # for sqlite3
    end 

    def self.doctors 
        joins(:doctor) # for postgres
        # joins(:doctor).where("user_id") # for sqlite3
    end 

    def self.find_or_create_by_google(auth_hash)
        self.find_or_create_by(email: auth_hash.info.email) do |u|
            u.firstname = auth_hash.info.first_name
            u.lastname = auth_hash.info.last_name
            u.username = auth_hash.uid
            u.password = SecureRandom.hex
        end 
    end 

    def self.find_or_create_by_github(auth_hash)
        self.find_or_create_by(username: auth_hash.uid) do |u|
            u.firstname = auth_hash.info.name.split[0]
            u.lastname = auth_hash.info.name.split[1]
            u.email = auth_hash.info.name.split.join.downcase + "@me.com"
            u.password = SecureRandom.hex
        end 
    end 
end 