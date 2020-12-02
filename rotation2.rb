# Rotation (Part 2)
#
# Problem
# Write a method that can rotate the last n digits of a number. The method takes
# two arguments, a number to be rotated and a number that indicates how many digits
# to rotate. Assume that n is always a positive integer. Rotating by just 1 digit 
# results in the original number being returned.
#
# Examples
# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917
#
#
# Data Structures / Type Signature
# Integer -> Array -> Integer
#
#
# Algorithm
# 1) convert integer to a string
# 2) take string slices to separate left portion (which will remain
#    unchanged) and right portion (which has the digits to be rotated)
# 3) rotate the right portion with #rotate_array
# 4) combine left portion and rotated portion into a single array
# 5) join the array elements into a string (Array#join('')) and convert to integer
#
# Code
require_relative 'rotation1'
require 'test/unit'

class Rotation2 < Test::Unit::TestCase
  def test_rotate_rightmost
    assert_equal(rotate_rightmost_digits(735291, 1), 735291)
    assert_equal(rotate_rightmost_digits(735291, 2), 735219)
    assert_equal(rotate_rightmost_digits(735291, 3), 735912)
    assert_equal(rotate_rightmost_digits(735291, 4), 732915)
    assert_equal(rotate_rightmost_digits(735291, 5), 752913)
    assert_equal(rotate_rightmost_digits(735291, 6), 352917)
  end
end

def rotate_rightmost_digits(number, digits_to_rotate)
  number_arr = number.to_s.split('')
  leftmost = number_arr[0, number_arr.length - digits_to_rotate]
  rightmost = number_arr[-digits_to_rotate, digits_to_rotate]
  rotated = rotate_array(rightmost)
  result_arr = leftmost + rotated
  result_arr.join('').to_i
end
