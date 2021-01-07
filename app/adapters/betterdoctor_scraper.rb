class BetterdoctorScraper
    # API for betterdoctor data
    

end 

# // This code depends on jQuery Core and Handlebars.js 

# var api_key = 'CODE_SAMPLES_KEY_9d3608187'; // Get your API key at developer.betterdoctor.com
# var resource_url = 'https://api.betterdoctor.com/2016-03-01/insurances?skip=0&limit=10&user_key=' + api_key;
# $.get(resource_url, function (data) {
#     // data: { meta: {<metadata>}, data: {<array[InsuranceProvider]>} }
#     var template = Handlebars.compile(document.getElementById('insurances-template').innerHTML);
#     document.getElementById('content-placeholder').innerHTML = template(data);
# });