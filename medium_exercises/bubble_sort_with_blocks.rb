# In an earlier exercise, you were asked to construct a #bubble_sort! method
# that used the bubble sort algorithm to sort Arrays in place. Our solution was this:

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
#   nil
# end

# The problem with this solution is that it doesn't give you any freedom in terms
# of the criteria used for the sort. For example, perhaps you want to sort the Array
# in reverse order from usual, or perhaps you want to sort a list of names in a
# case-insensitive manner.

# Your task in this assignment is to modify #bubble_sort! so it takes an optional
# block that determines which of two consecutive elements will appear first in the results.

# If you still have a copy of your #bubble_sort! method, you may use that method as the
# basis for this exercise. Otherwise, you can use the above solution.

# Examples:
# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# array == %w(alice bonnie Kim Pete rachel sue Tyler)

# def bubble_sort!(array)
#   loop do
#     max_index = array.size
#     index1 = 0
#     index2 = 1
#     swap = 0
#       until index2 == max_index
#         if array[index1] <= array[index2]
#           index1 += 1
#           index2 += 1
#         else
#           array[index1], array[index2] = array[index2], array[index1]
#           swap += 1
#           index1 += 1
#           index2 += 1
#         end
#       end
#       max_index -= 1 # Further Exploration
#       break if swap == 0
#   end
#   array
# end


# This solution allows the method caller to determine the sorting approach
# by using a <=> operator within the block. The block must return -1, 0, or 1
def bubble_sort!(array)
  loop do
    max_index = array.size
    index1 = 0
    index2 = 1
    swap = 0
      until index2 == max_index
        if ((block_given? && yield(array[index1], array[index2]) != 1) ||
           (!block_given? && array[index1] <= array[index2]))
          index1 += 1
          index2 += 1
        else
          array[index1], array[index2] = array[index2], array[index1]
          swap += 1
          index1 += 1
          index2 += 1
        end
      end
      max_index -= 1 # after each round of sorting, we don't have to check the last element - it is already fully sorted
      break if swap == 0
  end
  array
end

puts bubble_sort!([2, 3, 1, 5, 4]) { |first, second| second <=> first }

# Further Exploration
# Modify your solution so it only passes one element to the block at a time; the block
# should perform some sort of transformation to the argument, and #bubble_sort! itself
# should just use <= to compare two values. In other words, you should be able to call
# #bubble_sort! like this:

def bubble_sort!(array)
  loop do
    max_index = array.size
    index1 = 0
    index2 = 1
    swap = 0
      until index2 == max_index
        first_item = yield(array[index1])
        second_item = yield(array[index2])
        if first_item <= second_item
          index1 += 1
          index2 += 1
        else
          array[index1], array[index2] = array[index2], array[index1]
          swap += 1
          index1 += 1
          index2 += 1
        end
      end
      max_index -= 1 
      break if swap == 0
  end
  array
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p (array == %w(alice bonnie Kim Pete rachel sue Tyler))