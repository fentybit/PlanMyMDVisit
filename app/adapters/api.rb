class API
    # API from https://data.cms.gov/provider-data/dataset/mj5m-pzi6
    def self.data
        url = "https://data.cms.gov/provider-data/api/1/datastore/sql?query=%5BSELECT%20%2A%20FROM%20de1ecf9c-1c24-51fd-873b-15626d329f5a%5D%3B"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body

        JSON.parse(response.body)
    end 

    def self.insurance_data 
        binding.pry
        puts betterdoctor
    end 

end 