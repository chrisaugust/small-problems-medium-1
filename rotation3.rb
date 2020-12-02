# Rotation (Part 3)
#
# Problem
# Taking a number like 735291 and rotating to the left yields 352917.
# Now fixing the first digit in place and rotating the remaining digits will
# yield 329175. Keeping the first two digits in place and rotating again yields
# 321759. Keeping the first three digits in place and rotating --> 321597.
# Keeping the first four digits in place and rotating --> 321579. This is the
# 'maximum rotation' of the original number.
#
# Write a method that takes an integer argument and returns the maximum rotation
# of that argument. You do not have to handle multiple 0s.
#
# Examples
# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845
#
# Data Structures / Type Signature
#
# Algorithm
# 1) determine number of digits in the argument integer
#     - convert to string
#     - call String#length
# 2) use result from step 1 to create a loop with a counter; break when
#    counter == number of digits in argument
#     - 1st loop rotate the entire argument integer
#     - 2nd loop rotate all rightmost digits except first
#     - 3rd loop rotate all rightmost digits except second
#     - nth loop rotate last two digits
#  
#
# Code
require_relative 'rotation2'
require 'test/unit'
require 'pry'

class Rotation3 < Test::Unit::TestCase
  def test_max_rotation
    assert_equal(max_rotation(735291), 321579)
    assert_equal(max_rotation(3), 3)
    assert_equal(max_rotation(35), 53)
    assert_equal(max_rotation(105), 15)
    assert_equal(max_rotation(8_703_529_146), 7_321_609_845)
  end
end

def max_rotation(n)
  length = n.to_s.length
  counter = 0
  
  loop do
    break if counter == length - 1
    n = rotate_rightmost_digits(n, length - counter)
    counter += 1
  end

  return n
end
