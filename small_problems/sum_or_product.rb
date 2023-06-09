def valid_integer?(num)
  num.to_s.to_i == num && num > 0
end

def valid_choice?(choice)
  choice == 's' || choice == 'p'
end

def get_number
  puts ">> Please enter an integer greater than 0:"
  loop do
    number = gets.to_i

    return number if valid_integer?(number)

    puts "Invalid entry. Enter a whole number greater than 0:"
  end
end

def get_choice
  puts ">> Enter 's' to compute the sum, 'p' to compute the product:"
  loop do
    choice = gets.chomp.downcase

    return choice if valid_choice?(choice)

    puts "Invalid choice. Enter 's' for sum or 'p' for product:"
  end

end

def calculate_sum(number)
  sum = 0
  (1..number).each { |n| sum += n }
  sum
end

def calculate_product(number)
  product = 1
  (1..number).each { |n| product *= n }
  product
end

loop do
  number = get_number
  calculation_choice = get_choice
  
  if calculation_choice == 's'
    sum = calculate_sum(number)
    puts "The sum of integers between 1 and #{number} is #{sum}."
  elsif calculation_choice == 'p'
    product = calculate_product(number)
    puts "The product of integers between 1 and #{number} is #{product}."
  end
end