# Given this code:

# items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end

# Fill out the following method calls for gather so that they
# produce the corresponding output shown in numbers 1-4 listed below:

# 1:
#   gather(items) do | , |
#     puts
#     puts
#   end

#   Let's start gathering food.
#   apples, corn, cabbage
#   wheat
#   We've finished gathering!

# 2:
#   gather(items) do | , , |
#     puts
#     puts
#     puts
#   end

#   Let's start gathering food.
#   apples
#   corn, cabbage
#   wheat
#   We've finished gathering!

# 3:
#   gather(items) do | , |
#     puts
#     puts
#   end

#   Let's start gathering food.
#   apples
#   corn, cabbage, wheat
#   We've finished gathering!

# 4:
#   gather(items) do | , , , |
#     puts
#   end

#   Let's start gathering food.
#   apples, corn, cabbage, and wheat
#   We've finished gathering!


items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1:
  gather(items) do |*acc, wheat|
    puts acc.join(", ")
    puts wheat
  end

  # Let's start gathering food.
  # apples, corn, cabbage
  # wheat
  # We've finished gathering!

# 2:
  gather(items) do |apples, *cc, wheat|
    puts apples
    puts cc.join(", ")
    puts wheat
  end

  # Let's start gathering food.
  # apples
  # corn, cabbage
  # wheat
  # We've finished gathering!

# 3:
  gather(items) do |apples, *ccw|
    puts apples
    puts ccw.join(", ")
  end

  # Let's start gathering food.
  # apples
  # corn, cabbage, wheat
  # We've finished gathering!

# 4:
  gather(items) do |apples, corn, cabbage, wheat|
    puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
  end

  # Let's start gathering food.
  # apples, corn, cabbage, and wheat
  # We've finished gathering!

  # We could also adjust the gather method definition to adjust output accordingly,
  # but we would need to add a splat before the array argument to specify that we
  # want to use the array elements as the arguments and not just use the
  # array object as our only argument

  # e.g.
  def gather(*produce, wheat)
    puts "Let's start gathering food."
    p produce
    puts wheat
    puts "We've finished gathering!"
  end

  gather(*items)