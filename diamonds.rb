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
# 2) loop n times, adding a string to array
#     - 1st line is (n-1)/2 spaces + 1 star + (n-1)/2 spaces
#     - middle line is n stars
# 3) print array line by line to stdout
#
# Code
require 'test/unit'

class Diamonds < Test::Unit::TestCase
  def test_diamonds
    assert_equal(diamonds(1), "*")
    assert_equal(diamonds(3), " * \n***\n * ")
    # assert_equal(diamonds(5), "  *  \n ** \n***\n ** \n  *  ")
  end
end

def diamonds(n)
  arr = []

  if n == 1
    return "*"
  end
  
  (1..((n/2)+1)).each_with_index do |i| 
    arr[i-1] = ""
    if i <= (n/2) + 1
      (((n-i)/2)).times { arr[i-1] += " " }
      ((2*i)-1).times { arr[i-1] += "*" }
      (((n-i)/2)).times { arr[i-1] += " " }
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
