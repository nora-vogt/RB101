print 'What is your name? '
name = gets.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# From Hint:
  # can also use String#chomp or String#chop