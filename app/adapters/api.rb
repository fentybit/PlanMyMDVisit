class API
    # API from https://data.cms.gov/provider-data/dataset/mj5m-pzi6
    def self.data
        url = "https://data.cms.gov/provider-data/api/1/datastore/sql?query=%5BSELECT%20%2A%20FROM%20de1ecf9c-1c24-51fd-873b-15626d329f5a%5D%3B"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body

        JSON.parse(response.body)
    end 

    def self.doctors_information
        doctors_array = []
        data.each do |row|
            doctor = {}
            if !row.empty?
                doctor[:firstname] = row["frst_nm"].capitalize
                doctor[:lastname] = row["lst_nm"].capitalize
                doctor[:username] = (row["frst_nm"][0] + row["lst_nm"]).downcase
                doctor[:email] = (row["frst_nm"][0] + row["lst_nm"]).downcase + "@me.com"
                doctor[:password] = (row["frst_nm"][0] + row["lst_nm"]).downcase
                doctor[:gender] = row["gndr"]

                doctor[:specialty] = row["pri_spec"].titleize
                doctor[:hospital] = row["hosp_afl_lbn_1"].titleize
                doctor[:address] = row["adr_ln_1"].titleize
                doctor[:city] = row["cty"].titleize
                doctor[:state] = row["st"]
                doctor[:zipcode] = row["zip"][0..4]

                doctors_array << doctor 
            end 
        end 
    end 
end 

