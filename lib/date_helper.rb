require 'date'

class Today 

  def self.print_formatted
    date = Time.now.to_s[0, 10]
    year = date[0, 4]
    month = date[5..6]
    day = date[8, 10]
    day + "/" + month + "/" + year
  end

end