# Word to Digit
#
# Problem
# Write a method that takes a string as input and returns the same string with
# any sequence of the words 'zero' through 'nine' converted to a string of digits.
#
# Examples
# word_to_digit('Please call me at five five five one two three four. Thanks.') ==
#               'Please call me at 5 5 5 1 2 3 4. Thanks.'
#
# 
# Data Structure / Type Signature
# hash table for word to digit lookup
#
# String -> Array -> String
#
# 
# Algorithm
# 1) create a hash table with words as keys and digits as values
# 2) split string into array of words
# 3) iterate over words, checking if word matches the keys of the hash table
# 4) replace word with hash table value if word matches key 
# 5) join words into a single string and return
#
# Code
require 'test/unit'

class WordToDigit< Test::Unit::TestCase
  def test_word_to_digit
    assert_equal(word_to_digit('Please call me at five five five one two three four. Thanks.'), 
                 'Please call me at 5 5 5 1 2 3 4. Thanks.')

    assert_equal(word_to_digit('My birthday is on six / two seven / one nine eight four.'),
                 'My birthday is on 6 / 2 7 / 1 9 8 4.')
  end
end

def word_to_digit(str)
  hash = {'zero' => '0', 
          'one' => '1',
          'two' => '2',
          'three' => '3',
          'four' => '4',
          'five' => '5',
          'six' => '6',
          'seven' => '7',
          'eight' => '8',
          'nine' => '9' }

  words = str.split

  words.each_with_index do |word, idx|
    hash.each do |k, v|
      if word =~ /#{k}/
        word.gsub!(k, v)
      end
    end
  end

  return words.join(' ')
    
end
