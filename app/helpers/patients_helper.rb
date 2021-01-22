module PatientsHelper
    def twolatest_careteams(patient)
        patient.healthcare_teams.order(appointment: :desc).limit(2)
    end 
end