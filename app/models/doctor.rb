class Doctor < ApplicationRecord 
    belongs_to :healthcareprovider 
    belongs_to :user 
    has_many :healthcareteams 
    has_many :patients, through: :healthcareteams 
end 