# 1000 Lights 
#
# Problem
# You have a bank of switches before you, numbered from 1 to n. 
# Each switch is connected to exactly one light that is initially off. 
# You walk down the row of switches and toggle every one of them. 
# You go back to the beginning, and on this second pass, 
# you toggle switches 2, 4, 6, and so on. On the third pass, 
# you go back again to the beginning and toggle switches 3, 6, 9, 
# and so on. You repeat this process and keep going until you have 
# been through n repetitions.
#
# Write a method that takes one argument, the total number of switches,
# and returns an Array that identifies which lights are on after n repetitions.
#
#
# Examples
# Example with n = 5 lights:
#
#     round 1: every light is turned on
#     round 2: lights 2 and 4 are now off; 1, 3, 5 are on
#     round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
#     round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
#     round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
#
# The result is that 2 lights are left on, lights 1 and 4. 
# The return value is [1, 4].
#
# With 10 lights, 3 lights are left on: lights 1, 4, and 9. 
# The return value is [1, 4, 9].
#
#
# Data Structures / Type Signature
# 
# Hash to hold the state of the toggles
#
# function(Integer) -> Array
#
#
# Algorithm
# 1) use argument n to create a range
# 2) use range to initialize a hash, with ascending integers of the
#    range as the keys, and all values set to 'off' (indicating a light
#    that is off; else 'on')
# 3) use the range from step 1 to iterate over the hash:
#       - if key/iterator == 0, switch from true to false or vice versa 
# 4) return array of values equal to true
#
# Code
require 'test/unit'

class ThousandLights < Test::Unit::TestCase
  def test_toggle_switches
    assert_equal(toggle_switches(5), [1, 4])
    assert_equal(toggle_switches(10), [1, 4, 9])
  end
end

def toggle_switches(n)
  range = (1..n)
  
  hash = {}
  range.to_a.each do |n|
    hash[n] = "off"
  end
  
  range.each do |i|
    hash.each do |k,v|
      if (k % i == 0)
        hash[k] = switch(v)
      end
    end
  end

  results = hash.select { |k,v| v == "on" }
  results.keys
end

def switch(status)
  case status 
  when "off"
    status = "on"
  when "on"
    status = "off"
  end
  return status
end

