# Diamonds! 
#
# Problem
# Write a method that displays a 4-pointed diamond
# in an n by n grid where n is an odd integer supplied 
# as an argument to the method. Assume that the argument 
# will always be an odd integer.
#
#
# Examples
# 
# 
# diamond(1)
#
#  *
#
# diamond(3)
#
#  *
# ***
#  *
#
# diamond(9)
#
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
#
# 
# 
# Data Structures / Type Signature
# Integer -> Array -> String (printed to stdout)
#
#
# Algorithm
# 1) initialize an empty array  
# 2) loop (n/2)+ 1 times to get to the all diamond line, 
#    adding a string to the array for each loop
#    num_spaces_before_and_after = (n/2 + 1) - i  where i is the iteration of the loop through the range (1..(n/2 + 1))
#    num_asterisks = (2 * i) - 1  => [1,3,5,7 ...] with each iteration of the loop
# 3) add the bottom half of the diamond image by copying 
#    the lines from step 2 in reverse order (skipping the middle line)
# 4) print array line by line to stdout
#
# Code
require 'test/unit'

class Diamonds < Test::Unit::TestCase
  def test_diamonds
    assert_equal(diamonds(1), "*")
    assert_equal(diamonds(3), " * \n***\n * ")
    assert_equal(diamonds(5), "  *  \n *** \n*****\n *** \n  *  ")
    assert_equal(diamonds(9), "    *    \n   ***   \n  *****  \n ******* \n*********\n ******* \n  *****  \n   ***   \n    *    ")
  end
end

def diamonds(n)
  arr = []

  if n == 1
    return "*"
  end

  midpoint = n/2 + 1  
  (1..midpoint).each_with_index do |i| 
    arr[i-1] = ""
    if i < midpoint
      (midpoint - i).times { arr[i-1] += " " }
      (2*i - 1).times { arr[i-1] += "*" }
      (midpoint - i).times { arr[i-1] += " " }
    else
      n.times { arr[i-1] += "*" }
    end
  end

  # create bottom half of diamond by mirroring the array elements
  i = arr.length - 2 
  (arr.length - 1).times do
    arr << arr[i]
    i -= 1
  end
  
  arr.each { |line| puts line } 
  arr.join("\n")
end
