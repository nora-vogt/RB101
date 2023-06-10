print "Please write a word or multiple words: "
string = gets.chomp
number_of_characters = string.gsub(' ', '').size

puts "There are #{number_of_characters} characters in \"#{string}\"."

# From solution, could also use String#delete to remove spaces