module HealthcareTeamsHelper
    def appointment_time(healthcare_team)
        healthcare_team.appointment.strftime("%A, %B %d, %Y at %l:%M %p")
    end 

    def time(appointment)
        appointment.strftime("%l:%M %p")
    end 

    def date_time(appointment)
        appointment.strftime("%B %d, %Y at %l:%M %p")
    end 
end