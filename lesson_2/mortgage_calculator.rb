require 'pry'
# loan amount
# Annual Percentage Rate (APR)
# loan duration


# need to calculate:
  # monthly interest rate
  # loan duration in months
  # monthly payment

# PSEUDOCODE: 

# Display welcome message
# Ask user for loan amount - "loan_amount"
  # need to validate & format loan amount
    # validate that amount is a number
    # may have to remove commas or any non-numeric character
# Ask user for annual percentage rate (APR) of loan = annual_percentage_rate
  # validate that is a number
  # remove any non-numeric characters
# Ask user: is your loan term in months or years?
  # if months, ask user for loan duration in months - "duration_in_months"
  # if years, ask user for loan duration in years - "duration_in_years"

# TO CALCULATE:
# monthly_int_rate = annual_percentage_rate / 12?? **how do to this math?


# Ask user for loan duration in months  - "duration"
  # validate that duration is a number
# Ask user for monthly payment amount - "monthly_payment"
  # validate that payment amount is a number

  # formula for calculation
 # m = p * (j / (1 - (1 + j)**(-n)))
 # monthly_payment = loan_amount * (monthly_int_rate / (1 - (1 + monthly_int_rate)**(-duration_in_months)))

# def valid_int?(string)
# end

# def valid_float?(string)
# end

# def valid_number?(string)
#   valid_int?(string) || valid_float?(string)
# end

puts ">> Welcome to the Loan Calculator!"

puts ">> Please enter your loan amount"
print "$" 
loan_amount = gets.chomp

puts ">> Please enter your Annual Percentage Rate (APR):"
annual_percentage_rate = gets.chomp

puts ">> Is your loan term in months or years? (Enter 'months' or 'years'):"
term = gets.chomp.downcase

if term == 'years'
  puts ">> Enter your length of your loan in years:"
  duration_in_years = gets.chomp
elsif term == 'months'
  puts ">> Enter the length of your loan in months:"
  duration_in_months = gets.chomp
end

# need to check: if entering in years, need to convert duration to months
# if entering in months, no conversion necessary


monthly_int_rate = annual_percentage_rate.to_f / (12 * 100)

monthly_payment = loan_amount.to_i * (monthly_int_rate / (1 - (1 + monthly_int_rate)**(-duration_in_months.to_i)))

puts "Your monthly payment is #{monthly_payment}"   # need to: format to round at two decimal points
