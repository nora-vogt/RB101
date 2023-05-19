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

def valid_number?(string)
  /^\d+\.?\d?\d?$/.match(string) && string.to_f > 0
end

def valid_int?(string)
  string.to_i.to_s == string && string.to_i > 0
end

def read_duration(unit_of_time)
  prompt("Enter your length of your loan in #{unit_of_time}:")
  loop do
    duration = gets.chomp

    return duration if valid_int?(duration)

    prompt("Invalid entry. Enter the #{unit_of_time} as a positive number.")
    prompt("(Example: 18)")
  end
end

system("clear")
puts "\n-------------------------------------"
prompt("Welcome to Mortgage Calculator!")
puts <<-INTRO
  You can use this calculator to calculate your monthly payment.
INTRO
puts "-------------------------------------"
puts "\n"

loop do
  loan_amount = ''
  prompt("Please enter your loan amount:")
  loop do
    loan_amount = gets.chomp

    break if valid_number?(loan_amount)

    prompt("Invalid amount. Enter your loan amount as a positive number.")
    prompt("(Example: 100000 or 5000.50)")
  end

  puts "\n"
  prompt("Please enter your interest rate:")
  prompt("(Example: Enter 5 for 5% or 3.25 for 3.25%)")

  annual_percentage_rate = ''
  loop do
    annual_percentage_rate = gets.chomp

    break if valid_number?(annual_percentage_rate)

    prompt("Invalid entry. Enter the interest rate as a positive number.")
  end

  puts "\n"
  prompt("How would you like to enter your loan term?")
  prompt("(Enter 'months' or 'years')")

  term_in_months = ''
  term_in_years = ''
  loop do
    term = gets.chomp.downcase

    if term == 'years'
      term_in_years = read_duration('years')
    elsif term == 'months'
      term_in_months = read_duration('months')
    else
      prompt("Invalid loan term. Must enter 'months' or 'years':")
      next
    end

    break
  end

  puts "\n"
  prompt("Calculating your monthly payment...")

  if term_in_months.empty?
    term_in_months = term_in_years.to_i * 12
  else
    term_in_months = term_in_months.to_i
  end

  monthly_int_rate = annual_percentage_rate.to_f / (12 * 100)

  monthly_payment = loan_amount.to_f *
                    (monthly_int_rate /
                    (1 - (1 + monthly_int_rate)**(-term_in_months)))

  puts "\n"
  prompt("Your monthly payment is $#{format('%.2f', monthly_payment)}")

  puts "\n"
  prompt("Would you like to calculate another payment? (Y to calculate again):")
  answer = gets.chomp.downcase

  break if answer != 'y'
end

prompt("Thank you for using Loan Calculator. Goodbye!")
