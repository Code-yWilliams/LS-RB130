# Write a method called all? that behaves similarly to Enumerable#all? for arrays.
# It should take an Array as an argument, and a block. It should return true
# if the block returns true for all of the element values. Otherwise, it should return false.

# Your method should stop processing elements of the Array as soon as the block returns false.

# If the Array is empty, all? should return true, regardless of how the block is defined.

# Examples:
# all?([1, 3, 5, 6]) { |value| value.odd? } == false
# all?([1, 3, 5, 7]) { |value| value.odd? } == true
# all?([2, 4, 6, 8]) { |value| value.even? } == true
# all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# all?([1, 3, 5, 7]) { |value| true } == true
# all?([1, 3, 5, 7]) { |value| false } == false
# all?([]) { |value| false } == true

def all?(array)
  array.each do |element|
    return false unless yield(element)
  end
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true