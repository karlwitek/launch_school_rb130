class Clock

  attr_reader :total_min

  def initialize(hour, min = 0)
    total_min = (hour * 60) + min
    if total_min > -1440 && total_min < 1440
      @total_min = total_min > 0 ? total_min : 1440 + total_min
    else
      @total_min = total_min
    end
  end

  def self.at(hour, min = 0)
    Clock.new(hour, min)
  end

  def reduced_minutes
    total_min % 1440
  end

  def to_s
    hr, min = reduced_minutes.divmod(60)# use helper instead of total_min
    hours = hr.to_s
    hours.prepend('0') if hours.size == 1
    minutes = min.to_s
    minutes.prepend('0') if minutes.size == 1
    "#{hours}:#{minutes}"
  end

  def +(other_value)
    new_total = total_min + other_value
    Clock.new(0, new_total)
  end

  def -(other_value)
    new_total = total_min - other_value
    Clock.new(0, new_total)
  end

  def ==(other)
    total_min == other.total_min
  end
end
