require 'pry'

=begin
Regex for loan amount validation:
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
  /^\d+\.?\d?\d?$/.match(string)
end

def valid_int?(string)
  string.to_i.to_s == string && string.to_i != 0
end

def read_duration(unit_of_time)
  loop do
    duration = gets.chomp

    return duration if valid_int?(duration)

    puts ">>Invalid entry. Enter the number of #{unit_of_time} as a whole number (ex: '120'):"
  end
end

# def valid_float?(string)
#   string.to_f.to_s == string
# end

# def valid_number?(string)
#   valid_int?(string) || valid_float?(string)
# end

puts ">> Welcome to the Loan Calculator!"

loop do
  loan_amount = ''
  loop do
    puts ">> Please enter your loan amount:"
    print "$" 
    loan_amount = gets.chomp

    break if valid_number?(loan_amount)

    puts ">> Invalid amount. Enter your loan amount as a number (ex: 10000 or 5000.50)"
  end

  annual_percentage_rate = ''
  loop do
    puts ">> Please enter your Annual Percentage Rate (APR):"
    annual_percentage_rate = gets.chomp

    break if valid_number?(annual_percentage_rate)

    puts ">> Invalid APR. Enter your APR as a number (ex: 7 or 4.25)"
  end

  duration_in_months = ''
  duration_in_years = ''
  loop do
    puts ">> Is your loan term in months or years? (Enter 'months' or 'years'):"
    term = gets.chomp.downcase

    if term == 'years'
      puts ">> Enter your length of your loan in years:"
      duration_in_years = read_duration('years')
    elsif term == 'months'
      puts ">> Enter the length of your loan in months:"
      duration_in_months = read_duration('months')
    else
      puts ">> Invalid loan term. Must enter 'months' or 'years'"
      next
    end
    
    break if valid_int?(duration_in_years) || valid_int?(duration_in_months)
  end

  puts ">> Calculating your monthly payment..."

  # converting loan entered in years to months
  if duration_in_months.empty?
    duration_in_months = (duration_in_years.to_i * 12).to_s   # keeps loan term as a string
  end

  monthly_int_rate = annual_percentage_rate.to_f / (12 * 100)

  monthly_payment = loan_amount.to_f * (monthly_int_rate / (1 - (1 + monthly_int_rate)**(-duration_in_months.to_i)))

  puts "Your monthly payment is $#{format('%.2f', monthly_payment)}"   # Kernel#format('%.2f', number) - rounds float to two decimal places; returns rounded number as a String

  puts ">> Would you like to calculate another loan? (Y to calculate again):"
  answer = gets.chomp.downcase

  break if answer != 'y'
end

puts ">> Thank you for using Mortgage Calculator. Goodbye!"