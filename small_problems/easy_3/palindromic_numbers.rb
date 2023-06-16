def palindromic_number?(n)
  n.digits.join.to_i == n
end

# Another way, iterating:
def palindromic_number?(n)
  reversed_int_array = []

  n.to_s.chars.each do |char|
    reversed_int_array.unshift(char)
  end

  reversed_int_array.join.to_i == n
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true