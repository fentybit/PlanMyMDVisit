class Patient < ApplicationRecord 
    belongs_to :healthcareprovider 
    belongs_to :user 
    has_many :healthcareteams 
    has_many :doctors, through: :healthcareteams
end 