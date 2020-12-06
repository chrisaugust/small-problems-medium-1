# Stack Machine Interpretation 
#
# PROBLEM
# +++++++++++++++++++++++++++++++++
# Write a method that implements a mini stack-and-register programming language
# with the following commands:
#
#  n Place a value n in the "register". Do not modify the stack.
#
#  PUSH Push the register value on to the stack. 
#       Leave the value in the register.
#
#  ADD Pops a value from the stack and adds it to the register value, 
#      storing the result in the register.
#
#  SUB Pops a value from the stack and subtracts it from the register value, 
#      storing the result in the register.
#
#  MULT Pops a value from the stack and multiplies it by the register value, 
#       storing the result in the register.
#
#  DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
#  
#  MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
#
#  POP Remove the topmost item from the stack and place in register
#
#  PRINT Print the register value
#
#
# EXAMPLES
# ++++++++++++++++++++++++++++++++
#
# minilang('PRINT')
# # 0
#
# minilang('5 PUSH 3 MULT PRINT')
# # 15
#
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8
#
# minilang('5 PUSH POP PRINT')
# # 5
#
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7
#
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6
#
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12
#
# minilang('-3 PUSH 5 SUB PRINT')
# # 8
#
# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)
#
#
# DATA STRUCTURES/ TYPE SIGNATURE
# +++++++++++++++++++++++++++++++++++++++++
#
# LIFO stack 
#
# String -> Array (consisting of an Integer(Register) and an Array(Stack))
#
#
# ALGORITHM
# ++++++++++++++++++++++++++++++++++++++++
# 1) initialize an empty stack (array)
#    and a register variable set to 0
# 2) parse argument using a loop and case switch to 
#    perform relevant operation with stack and register

require 'minitest/autorun'

class StackMachine < Minitest::Test

  def test_minilang_print
    assert_equal minilang('5 PRINT'), [5, []]
  end

  def test_minilang_push
    assert_equal minilang('5 PUSH'), [5, [5]]
  end

  def test_minilang_pop
    assert_equal minilang('5 PUSH 7 POP'), [5, []]
  end

  def test_minilang_add
    assert_equal minilang('5 PUSH 5 ADD'), [10, []]
  end

  def test_minilang_subtract
    assert_equal minilang('5 PUSH 10 SUB'), [5, []]
  end

  def test_minilang_multiply
    assert_equal minilang('5 PUSH 5 MULT'), [25, []]
  end

  def test_minilang_divide
    assert_equal minilang('10 PUSH 20 DIV'), [2, []] 
  end

  def test_minilang_modulus
    assert_equal minilang('3 PUSH 5 MOD'), [2, []]
  end

  def test_minilang_examples
    assert_equal minilang('PRINT'), [0, []]
    assert_equal minilang('5 PUSH 3 MULT PRINT'), [15, []]
    assert_equal minilang('5 PRINT PUSH 3 PRINT ADD PRINT'), [8, []]
    assert_equal minilang('5 PUSH POP PRINT'), [5, []]
    assert_equal minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT'), [7, []]
    assert_equal minilang('3 PUSH PUSH 7 DIV MULT PRINT'), [6, []]
    assert_equal minilang('4 PUSH PUSH 7 MOD MULT PRINT'), [12, []]
    assert_equal minilang('-3 PUSH 5 SUB PRINT'), [8, []]
    assert_equal minilang('6 PUSH'), [6, [6]]
  end
end

def minilang(commands)
  register = 0
  stack = []

  commands.split.each do |command|
    case command
    when 'PRINT'
      puts register
    when 'PUSH'
      stack << register
    when 'POP'
      register = stack.pop
    when 'ADD'
      register += stack.pop
    when 'SUB'
      register -= stack.pop
    when 'MULT'
      register *= stack.pop
    when 'DIV'
      register /= stack.pop
    when 'MOD'
      register %= stack.pop
    else
      register = command.to_i
    end
  end

  return [register, stack]
end
