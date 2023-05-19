require 'pry'
def prompt(message)
  puts "=> #{message}"
end

=begin
Regex for loan amount & interest rate validation:
^\d+   string starts with one or more digits
\.?    followed by zero or one period (decimal point)
\d?    followed by zero or one digit
\d?    followed by zero or one digit
$      at the end of the string
(maximum of 2 decimal places is allowed)
=end

def valid_dollar_amount?(string)
  /^\d+\.?\d?\d?$/.match(string) && string.to_f > 0
end

def valid_int?(string)
  string.to_i.to_s == string
end

def valid_float?(string)
  string.to_f.to_s == string
end

def valid_number?(string)
  valid_int?(string) || valid_float?(string)
end

def valid_interest_rate?(string)
  valid_number?(string) && string.to_f >= 0 # next: update calculations so 0% interest is allowed
end

def valid_duration?(string)
  valid_number?(string) && string.to_f > 0
end

def loan_summary(amount, interest, term)
  <<-SUMMARY 
  With a loan amount of $#{amount} at #{interest}% APR, 
    paid over #{term} years:
  SUMMARY
end

system("clear")
puts "\n-------------------------------------"
prompt("Welcome to Mortgage Calculator!")
puts <<-INTRO

  You can use this calculator to find your:
    - Monthly payment amount
    - Loan term in months
    - Monthly interest rate

  To do so, you will need:
    - Your loan amount
    - Your loan's Annual Percentage Rate (APR)
    - Your loan term in years
INTRO
puts "-------------------------------------"
puts "\n"

loop do
  loan_amount = ''
  prompt("Please enter your loan amount:")
  loop do
    loan_amount = gets.chomp

    break if valid_dollar_amount?(loan_amount)

    prompt("Invalid amount. Enter your loan amount as a positive number.")
    prompt("(Example: 100000 or 5000.50)")
  end

  puts "\n"
  prompt("Please enter your interest rate:")
  prompt("(Example: Enter 5 for 5% or 3.25 for 3.25%)")

  annual_percentage_rate = ''
  loop do
    annual_percentage_rate = gets.chomp

    break if valid_interest_rate?(annual_percentage_rate)

    prompt("Invalid entry. Enter the interest rate as a positive number.")
  end

  puts "\n"
  prompt("Please enter your loan term in years.")
  prompt("Example: 10 for 10 years, 5.5 for 5 years, 6 months")

  term_in_years = ''
  loop do
    term_in_years = gets.chomp.downcase
    
    break if valid_duration?(term_in_years)

    prompt("Invalid loan term. Enter the years as a positive number.")
  end

  puts "\n"
  prompt("Calculating your monthly payment...")
  sleep(1)
  system("clear")

  term_in_months = term_in_years.to_f * 12
  monthly_int_rate = annual_percentage_rate.to_f / (12 * 100)

  monthly_payment = loan_amount.to_f *
                    (monthly_int_rate /
                    (1 - (1 + monthly_int_rate)**(-term_in_months)))

  puts "\n"
  prompt(loan_summary(loan_amount, annual_percentage_rate, term_in_years))

  puts "\n"
  prompt("Your monthly payment is $#{format('%.2f', monthly_payment)}.")
  prompt("Your monthly interest rate is #{format('%.4f', monthly_int_rate)}%.")
  prompt("Your loan term is #{term_in_months} months.")

  puts "\n"
  prompt("Would you like to calculate another loan? (Y to calculate again):")
  answer = gets.chomp.downcase

  if answer == 'y'
    system("clear")
  else
    break
  end
end

puts "\n"
prompt("Thank you for using Mortgage Calculator. Goodbye!")
