def palindrome?(arg)
  arg == arg.reverse
end

def palindromic_number?(n)
  palindrome?(n.to_s)
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true


# Further Exploration
# If the argument began with 1 or more zeroes, the method will no longer work. This is due to Ruby treating integers that begin with zero as an octal number (base 8)
# Ex: 0005.to_s -> "5".to_i -> 5
# The only way to check if a number beginning with 0 is a palindromic number is to call the method with that a String argument. ex: palindromic_number?("0005").