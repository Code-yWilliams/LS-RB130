# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'

def test_odd
  assert_equal(true, value.odd?)
end

# or

assert value.odd?, 'value is not odd'
# the assert assertion checks if the first argument is truthy. Else, the error message
# (second argument) is outputted