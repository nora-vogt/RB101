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

def greater_than_zero?(string)
  string.to_f > 0.0
end

def valid_dollar_amount?(string)
  /^\d+\.?\d?\d?$/.match(string) && greater_than_zero?(string)
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
  valid_number?(string) && string.to_f >= 0.0
end

def valid_duration?(string)
  valid_number?(string) && greater_than_zero?(string)
end

def get_amount
  prompt("Please enter your loan amount:")
  prompt("(Example: 100000 or 5000.50)")
  loop do
    amount = gets.chomp

    return amount if valid_dollar_amount?(amount)

    puts "\n"
    prompt("Invalid amount. Amount must be a number greater than zero.")
    prompt("Two decimal places are allowed. Try again:")
  end
end

def get_annual_percentage_rate
  loop do
    annual_percentage_rate = gets.chomp
    
    return annual_percentage_rate if valid_interest_rate?(annual_percentage_rate)

    puts "\n"
    prompt("Invalid APR. Enter a positive number without a % sign:")
  end
end

def get_loan_term
  loop do
    term_in_years = gets.chomp
    
    return term_in_years if valid_duration?(term_in_years)

    prompt("Invalid loan term. Loan term must be at positive number.")
    prompt("Loan term must be at least one year.")
  end
end

def loan_summary(amount, interest, term)
  <<-SUMMARY 
  Your loan amount is $#{amount} at #{interest}% APR, 
    paid over #{term} years:
  SUMMARY
end

system("clear")
puts "\n-------------------------------------"
prompt("Welcome to Mortgage Calculator!")
puts <<-INTRO

  You can use this calculator to determine your:
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
  loan_amount = get_amount()

  puts "\n"
  prompt("Please enter your Annual Percentage Rate.")
  prompt("Example: 3.0 for 3% or 5.25 for 5.25%")

  annual_percentage_rate = get_annual_percentage_rate()

  puts "\n"
  prompt("Please enter your loan term in years.")
  prompt("(Example: 10 for 10 years, 5.5 for 5 years, 6 months)")

  term_in_years = get_loan_term

  puts "\n"
  prompt("Calculating your monthly payment...")
  sleep(1)
  system("clear")

  term_in_months = term_in_years.to_f * 12
  annual_interest_rate = annual_percentage_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  monthly_percentage_rate = monthly_interest_rate * 100

  if annual_interest_rate.zero?
    monthly_payment = loan_amount.to_f / term_in_months
  else
    monthly_payment = loan_amount.to_f *
                      (monthly_interest_rate /
                      (1 - (1 + monthly_interest_rate)**(-term_in_months)))
  end

  puts "\n"
  prompt(loan_summary(loan_amount, annual_percentage_rate, term_in_years))

  puts "\n"
  prompt("Your monthly payment is $#{format('%.2f', monthly_payment)}.")
  prompt("Your monthly interest rate is #{format('%.2f', monthly_percentage_rate)}%.")
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
