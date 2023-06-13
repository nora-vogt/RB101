# def palindrome?(string)
#   string == string.reverse
# end

# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true


# Further Exploration
# Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. 

def palindromic_array?(array)
  reversed_array = []
  array.each { |n| reversed_array.unshift(n) }
  array == reversed_array
end

# p palindromic_array?([1, 2, 1]) # == true
# p palindromic_array?([1, 2, 3]) # == false
# p palindromic_array?([1, nil, " ", nil, 1]) # == true
# p palindromic_array?(["hi", "hello"]) # == false


#Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an if, unless, or case statement or modifier.

# There is both String#reverse and Array#reverse, so:

def palindrome?(arg)
  arg == arg.reverse
end

# Tried without using #reverse
def palindrome3?(arg)
  iterator = 0
  arg_as_array = []
  reversed_array = []

  while iterator < arg.size
    reversed_array << arg[iterator]
    arg_as_array.unshift(arg[iterator])
    iterator += 1
  end
  arg_as_array == reversed_array
end

p palindrome3?('madam') == true
p palindrome3?('Madam') == false          # (case matters)
p palindrome3?("madam i'm adam") == false # (all characters matter)
p palindrome3?('356653') == true
p palindrome3?([1, 2, 1]) == true
p palindrome3?([1, 2, 3]) == false
p palindrome3?([1, nil, " ", nil, 1]) == true
p palindrome3?(["hi", "hello"]) == false