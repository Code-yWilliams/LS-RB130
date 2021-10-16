# INTEGER#TIMES METHOD

def times(number)
  counter = 0
  until counter == number do
    yield(counter)
    counter += 1
  end
  num

# ARRAY#EACH METHODS

def each(array)
  array.size.times do |index|
    yield(array[index])
  end
  array
end

def each(array)
  counter = 0
  until counter == array.size do
    yield(array[counter])
    counter += 1
  end
  array
end

# ARRAY#SELECT METHOD

def select(array)
  result = []
  counter = 0
  until counter == array.size do 
    element = array[counter]
    result << element if yield(element)
    end
    counter += 1
  end
  result
end

# Array#reduce or Array#inject method
# like Enumerable#reduce, this method sets the initial accumulator to
# the first element if no accumulator argument is passed in (default)

def reduce(array, accumulator=nil)
  counter = 0

  if accumulator
    acc = accumulator
  else
    acc = array[0]
  end

  until counter == array.size do
    element = array[counter]
    acc = yield(acc, element) unless (accumulator.nil? && counter == 0)
    counter += 1
  end

  acc
end
