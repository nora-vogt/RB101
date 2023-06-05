require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('mortgage_messages.yml')
MONTHS_IN_YEAR = 12
ONE_HUNDRED = 100
ONE = 1

def spacer
  puts MESSAGES['empty_line']
end

def divider
  puts MESSAGES['divider']
end

def message(key)
  MESSAGES[key]
end

def print_prompt(key)
  puts "=> #{message(key)}"
end

def print_message_no_prompt(key)
  puts message(key)
end

def print_monthly_payment(monthly_payment)
  puts format(message('monthly_pmt'),
              payment: format('%.2f', monthly_payment))
end

def print_monthly_interest_rate(rate)
  puts format(message('monthly_int'),
              interest: format('%.2f', rate)) + "%"
end

def print_loan_term_in_months(months)
  puts format(message('loan_term_months'),
              months: months)
end

def print_loan_summary(amount, interest, term)
  puts <<~SUMMARY
  => Based on a loan amount of $#{amount} at #{interest}% APR, 
     paid over #{term} years:
  SUMMARY
end

def greater_than_zero?(string)
  string.to_f > 0.0
end

=begin
Regex for loan amount validation:
^\d+   string starts with one or more digits
\.?    followed by zero or one period (decimal point)
\d?    followed by zero or one digit
\d?    followed by zero or one digit
$      at the end of the string
=end

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
  print_prompt('enter_loan')

  loop do
    amount = gets.chomp

    return amount if valid_dollar_amount?(amount)

    spacer
    print_prompt('invalid_amount')
  end
end

def get_annual_percentage_rate
  print_prompt('enter_apr')

  loop do
    annual_percentage_rate = gets.chomp

    if valid_interest_rate?(annual_percentage_rate)
      return annual_percentage_rate
    end

    spacer
    print_prompt('invalid_apr')
  end
end

def get_loan_term
  print_prompt('enter_term')

  loop do
    term_in_years = gets.chomp

    return term_in_years if valid_duration?(term_in_years)

    spacer
    print_prompt('invalid_term')
  end
end

def calculate_monthly_payment(annual_int_rate,
                              monthly_int_rate,
                              loan_amount,
                              term_in_months)
  if annual_int_rate.zero?
    loan_amount.to_f / term_in_months
  else
    loan_amount.to_f *
      (monthly_int_rate /
      (ONE - (ONE + monthly_int_rate)**(-term_in_months)))
  end
end

def calculate_again?
  print_prompt('calculate_again')
  answer = gets.chomp.downcase

  answer == 'y'
end

system("clear")

divider
print_message_no_prompt('welcome')
spacer
print_message_no_prompt('intro')
divider
spacer

loop do
  loan_amount = get_amount
  spacer
  annual_percentage_rate = get_annual_percentage_rate
  spacer
  term_in_years = get_loan_term
  spacer

  print_prompt('calculating')

  sleep(ONE)

  term_in_months = (term_in_years.to_f * MONTHS_IN_YEAR).round
  annual_interest_rate = annual_percentage_rate.to_f / ONE_HUNDRED
  monthly_interest_rate = annual_interest_rate / MONTHS_IN_YEAR
  monthly_percentage_rate = monthly_interest_rate * ONE_HUNDRED

  monthly_payment = calculate_monthly_payment(annual_interest_rate,     
                                              monthly_interest_rate, loan_amount,
                                              term_in_months)

  spacer

  print_loan_summary(loan_amount, annual_percentage_rate, term_in_years)

  spacer
  divider

  print_monthly_payment(monthly_payment)

  print_monthly_interest_rate(monthly_percentage_rate)

  print_loan_term_in_months(term_in_months)

  divider
  spacer

  if calculate_again?
    system("clear")
  else
    break
  end
end

spacer
print_prompt('goodbye')
