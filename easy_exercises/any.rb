# Write a method called any? that behaves similarly to Enumerable#any? for arrays
# It should take an Array as an argument, and a block.
# It should return true if the block returns true for any of
# the element values. Otherwise, it should return false.

# Your method should stop processing elements of the Array as
# soon as the block returns true.

# If the Array is empty, any? should return false, regardless of
# how the block is defined.

# Your method may not use any standard ruby method that is named
# all?, any?, none?, or one?.

# Examples:
# any?([1, 3, 5, 6]) { |value| value.even? } == true
# any?([1, 3, 5, 7]) { |value| value.even? } == false
# any?([2, 4, 6, 8]) { |value| value.odd? } == false
# any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# any?([1, 3, 5, 7]) { |value| true } == true
# any?([1, 3, 5, 7]) { |value| false } == false
# any?([]) { |value| true } == false

def any?(array)
  return false if array.empty?
  array.each do |element|
    return true if yield(element)
  end
  false
end

def any?(collection)
  collection.each do |item|
    return true if yield(item) 
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false