class Trip < ActiveRecord::Base
    belongs_to :user

    def date_setter(string)
        dates = string
        dates = dates.split(/-/).reverse

        month = dates[1]
        day = dates[0]
        year = dates[2]
        
        dates[0] = month 
        dates[1] = day
        dates[2] = year
        dates
    end
end