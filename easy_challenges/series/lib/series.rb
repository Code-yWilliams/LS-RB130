class Series
  attr_reader :series

  def initialize(series)
    @series = series.split("").map(&:to_i)
  end

  def slices(size)
    raise ArgumentError unless size <= series.size
    result = []
    index = 0
    until index + size-1 >= series.size
      slice = series[index, size]
      result << slice
      index += 1
    end
    result
  end
end


# OR:
# class Series
#   attr_accessor :str

#   def initialize(str)
#     @str = str
#   end

#   def slices(length)
#     raise ArgumentError.new if length > str.size
#     str.chars.map(&:to_i).each_cons(length).to_a
#   end
# end