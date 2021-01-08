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

primary_user = User.create(firstname: "Fenty", lastname: "Hall", username: "fenty", email: "fenty@me.com", password: "fenty", gender: "F")
primary_user.patients.create(medical_record: "Extremely healthy", test_results: "Too good to be true", medications: "Vitamins only")

# Instantiate Doctors from CMS JSON Data
JSON.parse(File.read("doctors.json")).each do |doctor|
    user = User.create(firstname: doctor["firstname"], lastname: doctor["lastname"], username: doctor["username"], email: doctor["email"], password: doctor["password"], gender: doctor["gender"])

    doctor = Doctor.create(specialty: doctor["specialty"], hospital: doctor["hospital"], address: doctor["address"], city: doctor["city"], state: doctor["state"], zipcode: doctor["zipcode"])
    
    # doctor.user_id = user.id 
end 

puts "Seeding success!"