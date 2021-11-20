require 'date'

class Meetup
  DAYS = { monday: 1, tuesday: 2, wednesday: 3, thursday: 4,
           friday: 5,  saturday: 6, sunday: 7 }

  attr_reader :year, :month, :whole_month

  def initialize(yr, mo)
    @year = yr
    @month = mo
    @whole_month = whole_month
  end

  def whole_month
    days = []
    date = Date.new(year, month, 1)
    until date.month != month 
      days << date
      date += 1
    end
    days
  end

  def day(day, descriptor)
    options = whole_month.select do |option|
                option.cwday == DAYS[day.downcase.to_sym]
              end
    descriptor.downcase!
    result = case descriptor
             when 'first' then options[0]
             when 'second' then options[1]
             when 'third' then options[2]
             when 'fourth' then options[3]
             when 'fifth' then options[4]
             when 'last' then options[-1]
             when 'teenth'
              options.select { |day| day.day >= 13 }.first
             end
    result
  end
end