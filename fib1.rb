# Fibonacci Numbers (Recursion)
#
# Problem
# Write a recursive method to compute the nth Fibonacci number, 
# where n is an argument to the method.
#
#
# Examples
# fibonacci(1) == 1
# fibonacci(2) == 1
# fibonacci(3) == 2
# fibonacci(4) == 3
# fibonacci(5) == 5
# fibonacci(12) == 144
# fibonacci(20) == 6765
#
#
# Data Structures / Type Signature
# Int -> Int
#
# Algorithm
#
# Code
require 'test/unit'

class FibonacciNumbers < Test::Unit::TestCase
  def test_fibonacci
    assert_equal(fibonacci(1), 1) 
    assert_equal(fibonacci(2), 1)
    assert_equal(fibonacci(3), 2)
    assert_equal(fibonacci(4), 3)
    assert_equal(fibonacci(5), 5)
    assert_equal(fibonacci(12), 144)
    assert_equal(fibonacci(20), 6765)
  end
end

def fibonacci(n)
  if n < 2
    n
  else
    fibonacci(n-1) + fibonacci(n-2)
  end
end
