# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Remove all existing DB
User.destroy_all
Patient.destroy_all
Doctor.destroy_all 
HealthcareTeam.destroy_all 
HealthcareProvider.destroy_all

# Instantiate Doctors from CMS JSON Data

# Instantiate Providers from CMS JSON Data