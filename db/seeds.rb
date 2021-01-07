# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# def doctors
#     response = RestClient.get 'https://api.betterdoctor.com/2016-03-01/doctors?location=37.773%2C-122.413%2C100&user_location=37.773%2C-122.413&skip=0&limit=10&user_key=0d9d4eaa7e324b61b60d471f1467a597'
#     json = JSON.parse(response)

#     if !json.nil?
#         json["data"].map do |doctor|
#             User.create(firstname: "#{doctor["profile"]["first_name"]}", lastname: "#{doctor["profile"]["last_name"]}")
#         end 
#     else  
#         puts "error seeding doctors"
#     end 
# end 

# doctors()
# puts "seeding success"