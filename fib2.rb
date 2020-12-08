# Fibonacci Numbers (Procedural)
# 
# Problem
# Recursive approaches bog down with higher values of n. To avoid this
# issue, write a procedural method to compute the nth Fibonacci number, 
# where n is an argument to the method.
#
#
# Examples
# fibonacci(12) == 144
# fibonacci(20) == 6765
# fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501#
#
# Data Structures / Type Signature
# Int -> Int
#
# Algorithm
# 1) initiate array with the following values: [0, 1, 1]
# 2) append array values by summing the last two: array << arr[-1] + arr[-2]
# 3) continue until the index value matches the method's argument
#
#
# Code
require 'test/unit'

class FibonacciNumbers < Test::Unit::TestCase
  def test_fibonacci
    assert_equal(fibonacci(12), 144)
    assert_equal(fibonacci(20), 6765)
    assert_equal(fibonacci(100), 354224848179261915075)
  end
end

def fibonacci(n)
  fibnums = [0, 1, 1] 

  while fibnums.index(fibnums[-1]) < n
    fibnums << fibnums[-1] + fibnums[-2]
  end

  fibnums[-1]
end
