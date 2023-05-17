require 'pry'

=begin
Regex for loan amount & APR validation:
^\d+   string starts with one or more digits
\.?    followed by zero or one period (decimal point)
\d?    followed by zero or one digit
\d?    followed by zero or one digit
$      at the end of the string

currently matches:
1212.00
1212.43
10000
100.0
1000.

if want to not match 100. or 100.0, remove the question marks after the digits
also, currently a loan of $0 is allowed
=end

def valid_number?(string)
  /^\d+\.?\d?\d?$/.match(string) && string.to_f > 0
end

def valid_int?(string)
  string.to_i.to_s == string && string.to_i > 0
end

def read_duration(unit_of_time)
  puts "\n>> Enter your length of your loan in #{unit_of_time}:"
  loop do
    duration = gets.chomp

    return duration if valid_int?(duration)

    puts ">>Invalid entry. Enter the number of #{unit_of_time} as a positive number." 
    puts "(Example: 18)"
  end
end
puts "\n-------------------------------------"
puts ">> Welcome to Loan Calculator!"
puts "-------------------------------------"
puts "\n"

loop do
  loan_amount = ''
  puts ">> Please enter your loan amount:"
  loop do
    loan_amount = gets.chomp

    break if valid_number?(loan_amount)

    puts ">> Invalid amount. Enter your loan amount as a positive number." 
    puts "(Example: 100000 or 5000.50)"
  end

  annual_percentage_rate = ''
  puts "\n>> Please enter your interest rate:"
  puts "(Example: Enter 5 for 5% or 3.25 for 3.25%)"
  loop do
    annual_percentage_rate = gets.chomp

    break if valid_number?(annual_percentage_rate)

    puts ">> Invalid interest rate. Enter your interest rate as a positive number."
  end

  term_in_months = ''
  term_in_years = ''
  puts "\n>> How would you like to enter your loan term?"
  puts "(Enter 'months' or 'years')"
  loop do
    term = gets.chomp.downcase

    if term == 'years'
      term_in_years = read_duration('years')
    elsif term == 'months'
      term_in_months = read_duration('months')
    else
      puts ">> Invalid loan term. Must enter 'months' or 'years'"
      next
    end
    
    break if valid_int?(term_in_years) || valid_int?(term_in_months)
  end

  puts "\n>> Calculating your monthly payment..."

  # converting loan entered in years to months
  if term_in_months.empty?
    term_in_months = (term_in_years.to_i * 12).to_s   # keeps loan term as a string
  end

  monthly_int_rate = annual_percentage_rate.to_f / (12 * 100)

  monthly_payment = loan_amount.to_f * (monthly_int_rate / (1 - (1 + monthly_int_rate)**(-term_in_months.to_i)))

  puts "Your monthly payment is $#{format('%.2f', monthly_payment)}"   # Kernel#format('%.2f', number) - rounds float to two decimal places; returns rounded number as a String

  puts "\n>> Would you like to calculate another loan? (Y to calculate again):"
  answer = gets.chomp.downcase

  break if answer != 'y'
end

puts "\n>> Thank you for using Loan Calculator. Goodbye!"