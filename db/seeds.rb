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


# Set up first User Patient
primary_user = User.create(firstname: "Fenty", lastname: "Hall", username: "fenty", email: "fenty@me.com", password: "fenty", password_confirmation: "fenty")
primary_user.patients.create(
    medical_record: "Patient has a mild osteoarthritis. For the sake of the patient's wellbeing, it is advised that the patient must refrain from carrying heavy materials and must allocate up to 30 minutes of exercise daily.", 
    test_results: "20210107 - X-Ray results suggest mild osteoarthritis.", 
    medications: "Ibuprofen, 600 mg; thrice a day, after meal. Noproxen Sodium, 500 mg; Once A Day.")

# Set up first User Admin 
admin = User.create(firstname: "Shelby", lastname: "Hall", username: "admin", email: "shelby@me.com", password: "admin", password_confirmation: "admin")

# Instantiate Doctors from CMS JSON Data
JSON.parse(File.read("doctors.json")).each do |doctor|
    user = User.create(firstname: doctor["firstname"], lastname: doctor["lastname"], username: doctor["username"], email: doctor["email"], password: doctor["password"], admin: true)

    user.doctors.build(gender: doctor["gender"], specialty: doctor["specialty"], hospital: doctor["hospital"], address: doctor["address"], city: doctor["city"], state: doctor["state"], zipcode: doctor["zipcode"])

    user.save 
end 

puts "Seeding success!"