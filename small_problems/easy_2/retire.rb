require 'date'
require 'pry'

print "What is your age? "
age = gets.to_i

print "At what age would you like to retire? "
retirement_age = gets.to_i

years_to_retirement = retirement_age - age
current_year = Time.now.year
retirement_year = current_year + years_to_retirement

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You only have #{years_to_retirement} years of work to go!"