module HealthcareTeamsHelper
    def appointment_time(healthcare_team)
        healthcare_team.appointment.strftime("%A, %B %d, %Y at %l:%M %p")
    end 
end