require 'date'

class Meetup 

  attr_reader :year, :month, :hash

  def initialize(year, month)
    @year = year
    @month = month
    @last_day_of_month = Date.civil(year, month, -1).day
    @hash = { 'first' => (1..7), 'second' => (8..14), 'third' => (15..21), 'fourth' => (22..28),
              'fifth' => (29..31), 'teenth' => (13..19), 'last' => (22..31) }
  end

  def day(weekday, desc) # return format of Date.civil (2020-02-15)
    weekday = weekday.capitalize
    desc.downcase!
    date_of_month = nil 
    hash[desc].each do |dom|
      date = Date.civil(year, month, dom) unless dom > @last_day_of_month
      if !date.nil?
        if date.strftime("%A") == weekday
          date_of_month = dom
        end
      end
    end
    return nil if date_of_month == nil 
    Date.civil(year, month, date_of_month)
  end
end
