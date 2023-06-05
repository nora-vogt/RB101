# age = rand(20..200)
# puts "Teddy is #{age} years old!"

#Further Exploration:
# Ask for a name, then print the age for that person. 
# Use "Teddy" as the default if no name is entered.

puts ">> What is your name?"
name = gets.chomp
age = rand(20..200)

if name.empty?
  puts puts "Teddy is #{age} years old!"
else
  puts "#{name} is #{age} years old!"
end