require 'pry'
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
      puts ">> Invalid entry. Try again."
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