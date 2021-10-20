# Write a method that takes a sorted array of integers
# as an argument, and returns an array that includes
# all of the missing integers (in order) between the
# first and last elements of the argument.

# Examples:
# missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# missing([1, 2, 3, 4]) == []
# missing([1, 5]) == [2, 3, 4]
# missing([6]) == []

def missing(sorted_array)
  result = []
  (sorted_array[0]..sorted_array[-1]).each do |int|
    result << int unless sorted_array.include?(int)
  end
  result
end

def missing(sorted_array)
  full_sequence = (sorted_array[0]..sorted_array[-1]).to_a
  full_sequence - sorted_array
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []