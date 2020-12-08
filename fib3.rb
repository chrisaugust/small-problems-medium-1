# Fibonacci Numbers (Last Digit)
# 
# Problem
# Write a method that computes the last digit of the nth
# fibonacci number, where n is the argument.
#
# Examples
# 
# fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4
# 
# Data Structures / Type Signature
#
# Array to hold values for 60 number cycle for last digits 
#
# Int -> Int
#
# Algorithm
# This algorithm will take advantage of the fact that the last digits of fibonacci
# numbers have a repeating 60 number cycle.
# 1) compute first 60 fibonacci numbers
# 2) store last digit in an array
# 3) for any fibonacci number greater than 60, find modulo 60 and look up in the array
#
# Code
require 'test/unit'
require_relative 'fib2'

class FibonacciLastDigit < Test::Unit::TestCase
  def test_fibonacci
    p fibonacci_last(15)
    assert_equal(fibonacci_last(15), 0) 
    assert_equal(fibonacci_last(20), 5)
    assert_equal(fibonacci_last(100), 5)
    assert_equal(fibonacci_last(100_001), 1)
    assert_equal(fibonacci_last(1_000_007), 3)
    assert_equal(fibonacci_last(123456789), 4)
  end
end

def fibonacci_last(n)
  last_digits = (1..60).to_a.map do |i| 
    x = fibonacci(i) 
    x.to_s[-1].to_i
  end
  
  last = last_digits[(n-1) % 60]
end
