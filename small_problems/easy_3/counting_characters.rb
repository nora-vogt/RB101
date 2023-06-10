print "Please write a word or multiple words: "
string = gets.chomp

string_with_no_spaces = string.gsub(' ', '')
puts "There are #{string_with_no_spaces.size} characters in \"#{string}\"."

# From solution, could also use String#delete to remove spaces