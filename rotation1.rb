# Rotation (Part 1)
#
# Problem
# Write a method that rotates an array by moving the first element to 
# the end of the array. The original array should not be modified. Don't use
# Array#rotate or Array#rotate! but instead roll your own.
#
#
# Examples
# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']
#
# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true
#
#
# Data Structures / Type Signature
# array -> array
#
#
# Algorithm
# 1) duplicate the values of argument array in a second array
# 2) save the first value in a temporary variable (temp)
# 3) call Array#shift on the second array
# 4) push temp to second array
#
#
# Code
require 'test/unit'

class Rotation1 < Test::Unit::TestCase
  def test_rotate_array
    assert_equal(rotate_array([7, 3, 5, 2, 9, 1]), [3, 5, 2, 9, 1, 7])
    assert_equal(rotate_array(['a', 'b', 'c']), ['b', 'c', 'a'])
    assert_equal(rotate_array(['a']), ['a'])

    x = [1, 2, 3, 4]
    assert_not_equal(rotate_array(x).object_id, x.object_id)
  end
end

def rotate_array(arr)
  rotated_arr = arr.dup
  
  temp = rotated_arr[0]
  
  rotated_arr.shift
  
  rotated_arr << temp 
end
