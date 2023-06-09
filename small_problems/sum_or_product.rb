def valid_integer?(num)
  num.to_s.to_i == num && num > 0
end

def valid_choice?(choice)
  choice == 's' || choice == 'p'
end

loop do
  puts ">> Please enter an integer greater than 0:"

  number = nil
  loop do
    number = gets.to_i

    break if valid_integer?(number)
    puts "Invalid entry. Enter a whole number greater than 0:"
  end

  puts ">> Enter 's' to compute the sum, 'p' to compute the product:"
  product = nil
  calculation_choice = ''
  loop do
    calculation_choice = gets.chomp.downcase

    break if valid_choice?(calculation_choice)
    puts "Invalid choice. Enter 's' for sum or 'p' for product:"
  end

  if calculation_choice == 's'
    sum = 0
    (1..number).each { |n| sum += n }
    puts "The sum of integers between 1 and #{number} is #{sum}."
  elsif calculation_choice == 'p'
    product = 1
    (1..number).each { |n| product *= n }
    puts "The product of integers between 1 and #{number} is #{product}."
  end
end