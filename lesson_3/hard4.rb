def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4 # guard clause, return false if there are more or fewer than 4 components to IP address

  dot_separated_words.each do |word|
    return false unless is_an_ip_number?(word)
  end

  true
end

# Solution - keep the while loop, just modify:
  # But also not best practice? This solution is mutating the dot_separated_words array while looping.
  
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
