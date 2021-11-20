class Clock
  attr_reader :hour, :minute

  def initialize(hour, minute=0)
    @hour = hour
    @minute = minute
  end

  def to_s
    hr = hour.to_s
    min = minute.to_s
    [hr, min].each do |int|
      int.prepend("0") if int.size == 1
    end
    "#{hr}:#{min}"
  end

  def +(minutes)
    additional_hours, additional_minutes = minutes.divmod(60)
    total_hours = hour + additional_hours
    total_minutes = minute + additional_minutes

    extra_hours, total_minutes = total_minutes.divmod(60)
    total_hours += extra_hours
    total_hours %= 24
    @hour = total_hours
    @minute = total_minutes
    self
  end

  def -(minutes)
    fewer_hours, fewer_minutes = minutes.divmod(60)
    total_hours = hour - fewer_hours
    total_minutes = minute - fewer_minutes

    missing_hour, total_minutes = total_minutes.divmod(60)
    total_hours += missing_hour
    total_hours %= 24
    @hour = total_hours
    @minute = total_minutes
    self
  end

  def ==(other)
    hour == other.hour &&
    minute == other.minute
  end

  def self.at(hour, minute=0)
    Clock.new(hour, minute)
  end
end

# SIMPLER SOLUTION:

# class Clock
#   MINUTES_PER_HOUR = 60
#   MINUTES_PER_DAY = 1440

#   def self.at(hour, minute = 0)
#     minutes = (hour * MINUTES_PER_HOUR) + minute 
#     Clock.new(minutes)
#   end

#   def initialize(minutes)
#     @minutes = minutes
#   end

#   def to_s 3661
#     days = @minutes.divmod(MINUTES_PER_DAY)
#     time = days[1].divmod(MINUTES_PER_HOUR)
#     format("%02d:%02d", time[0], time[1])
#   end

#   def +(other)
#     @minutes += other
#     self
#   end

#   def -(other)
#     @minutes -= other
#     self
#   end

#   def ==(other)
#     to_s == other.to_s
#   end
# end