# fill in the missing part of the following code so we can convert
# an array of integers to base 8 (octal numbers). Use the comments
# for help in determining where to make your modifications, and make
# sure to review the "Approach/Algorithm" section for this exercise;
# it should prove useful.

# def convert_to_base_8(n)
#   n.method_name.method_name # replace these two method calls
# end

# # The correct type of argument must be used below
# base8_proc = method(argument).to_proc

# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
# [8, 10, 12, 14, 16, 33].map(&a_proc)

# The expected return value of map on this number array should be:

# [10, 12, 14, 16, 20, 41]




def convert_to_base_8(n)
  n.to_s(8).to_i 
end
# This method turns argument n into an integer in base 8 and returns it


base8_proc = method(:convert_to_base_8).to_proc
# This line uses Object#method to return a method object that has the functionality
# of the method passed to it as a symbol, so this method object can convert base 10 to base 8
# then we call Method#to_proc, which instantiates a new proc as follows:
# Proc.new { |n| n.to_s(8).to_i }



p ([8, 10, 12, 14, 16, 33].map(&base8_proc))
# On this line, we pass the newly-created proc to the Enumerable#map method. The & sign
# converts it to a block which is then yielded to from the map method