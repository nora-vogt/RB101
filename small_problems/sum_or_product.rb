puts ">> Please enter an integer greater than 0:"
number = gets.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product:"
calculation_choice = gets.chomp.downcase

if calculation_choice == 's'
  sum = 0
  (1..number).each { |n| sum += n }
  puts "The sum of integers between 1 and #{number} is #{sum}."
elsif calculation_choice == 'p'
  product = 1
  (1..number).each { |n| product *= n }
  puts "The product of integers between 1 and #{number} is #{product}."
else
  puts "Invalid choice."
end