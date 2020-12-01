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
# Integer -> Integer
#
#
# Algorithm
# 0) (number / 10**digits_to_rotate) * 10**digits to rotate gives the unchanged portion of the number
# 1) number % 10**digits_to_rotate gives the rightmost numbers to rotate
# 2) call #rotate_array on results from step 1
# 3) add results of step 0 and step 1 to find the final, rotated result
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
  unrotated_portion = (number / 10**digits_to_rotate)*(10**digits_to_rotate) 
  rightmost_to_rotate = number % 10**digits_to_rotate
  rotated_digits = rotate_array(rightmost_to_rotate)
  unrotated_portion + rotated_digits
end
