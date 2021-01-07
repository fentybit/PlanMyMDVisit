class BetterdoctorScraper
    # API for betterdoctor data
    def self.betterdoctor
        url = "https://api.betterdoctor.com/2016-03-01/doctors?location=37.773%2C-122.413%2C100&user_location=37.773%2C-122.413&skip=0&limit=10&user_key=0d9d4eaa7e324b61b60d471f1467a597"

        response = RestClient.get url
        JSON.parse(response)
    end 

    def self.insurance_data 
        binding.pry
        puts betterdoctor
    end 

end 

# // This code depends on jQuery Core and Handlebars.js 

# var api_key = 'CODE_SAMPLES_KEY_9d3608187'; // Get your API key at developer.betterdoctor.com
# var resource_url = 'https://api.betterdoctor.com/2016-03-01/insurances?skip=0&limit=10&user_key=' + api_key;
# $.get(resource_url, function (data) {
#     // data: { meta: {<metadata>}, data: {<array[InsuranceProvider]>} }
#     var template = Handlebars.compile(document.getElementById('insurances-template').innerHTML);
#     document.getElementById('content-placeholder').innerHTML = template(data);
# });