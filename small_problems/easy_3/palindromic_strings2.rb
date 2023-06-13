def real_palindrome?(string)
  test_string = string.downcase.gsub(/\W/, '')
  test_string == test_string.reverse
end


p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
p real_palindrome?("Madam,&*@&# I'm **A d a m    ") == true