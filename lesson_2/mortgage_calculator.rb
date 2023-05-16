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
    # validate number
  # if years, ask user for loan duration in years - "duration_in_years"
    # validate number
# Ask user for monthly payment amount - "monthly_payment"
  # validate that payment amount is a number

# convert APR to monthly interest rate (monthly rate = APR / (12 * 100)) => expresses interest rate as number. ex: APR = 6.0% -> monthly is 0.5% -> 0.005 decimal conversion

# calculate monthly loan payment
# display monthly payment amount

  # formula for calculation
 # m = p * (j / (1 - (1 + j)**(-n)))
 # monthly_payment = loan_amount * (monthly_int_rate / (1 - (1 + monthly_int_rate)**(-duration_in_months)))

def valid_int?(string)
  string.to_i.to_s == string
end

def valid_float?(string)
  string.to_f.to_s == string
end

def valid_number?(string)
  valid_int?(string) || valid_float?(string)
end

puts ">> Welcome to the Loan Calculator!"

loop do
  loan_amount = ''
  loop do
    puts ">> Please enter your loan amount:"
    print "$" 
    loan_amount = gets.chomp

    break if valid_number?(loan_amount)

    puts ">> Invalid number."
  end

  annual_percentage_rate = ''
  loop do
    puts ">> Please enter your Annual Percentage Rate (APR):"
    annual_percentage_rate = gets.chomp

    break if valid_number?(annual_percentage_rate)

    puts ">> Invalid APR. Please enter your APR as a number (ex: 7)."
  end

  duration_in_months = ''
  duration_in_years = ''
  loop do
    puts ">> Is your loan term in months or years? (Enter 'months' or 'years'):"
    term = gets.chomp.downcase

    if term == 'years'
      puts ">> Enter your length of your loan in years:"
      duration_in_years = gets.chomp
    elsif term == 'months'
      puts ">> Enter the length of your loan in months:"
      duration_in_months = gets.chomp
    else
      puts ">> Invalid entry."
      next
    end

    if duration_in_months.empty?
      duration_in_months = (duration_in_years.to_i * 12).to_s   # keeps loan term as a string
    end

    break if valid_number?(duration_in_years) || valid_number?(duration_in_months)

    puts "Invalid loan term. Please enter your loan duration again."
    # later - have this be two loops with separate, specific error messages to each term
  end

  puts ">> Calculating your monthly payment..."

  monthly_int_rate = annual_percentage_rate.to_f / (12 * 100)

  monthly_payment = loan_amount.to_i * (monthly_int_rate / (1 - (1 + monthly_int_rate)**(-duration_in_months.to_i)))

  puts "Your monthly payment is $#{format('%.2f', monthly_payment)}"   # Kernel#format('%.2f', number) - rounds float to two decimal places; returns rounded number as a String

  puts ">> Would you like to calculate another loan? (Y to calculate again):"
  answer = gets.chomp.downcase

  break if answer != 'y'
end

puts ">> Thank you for using Mortgage Calculator. Goodbye!"