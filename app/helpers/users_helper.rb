module UsersHelper
    def date_and_time(datetime)
        datetime.strftime("%A, %B %d, %Y at %l:%M %p")
    end 
end