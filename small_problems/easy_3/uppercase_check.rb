def uppercase?(str)
  alphabetic_chars = str.delete('^A-Za-z')
  alphabetic_chars.chars do |char|
    return false if char != char.upcase
  end

  true
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true