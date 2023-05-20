require 'yaml'

MESSAGES = YAML.load_file('mortgage_messages.yml')

def prompt(key)
  puts "=> #{MESSAGES[key]}"
end

def spacer
  puts MESSAGES['empty_line']
end

def divider
  puts MESSAGES['divider']
end

def print_message_no_prompt(key)
  puts MESSAGES[key]
end

def return_message(key)
  MESSAGES[key]
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
  prompt('enter_loan')

  loop do
    amount = gets.chomp

    return amount if valid_dollar_amount?(amount)

    spacer
    prompt('invalid_amount')
  end
end

def get_annual_percentage_rate
  prompt('enter_apr')

  loop do
    annual_percentage_rate = gets.chomp

    if valid_interest_rate?(annual_percentage_rate)
      return annual_percentage_rate
    end

    spacer
    prompt('invalid_apr')
  end
end

def get_loan_term
  prompt('enter_term')

  loop do
    term_in_years = gets.chomp

    return term_in_years if valid_duration?(term_in_years)

    spacer
    prompt('invalid_term')
  end
end

def loan_summary(amount, interest, term)
  puts <<~SUMMARY
  => Based on a loan amount of $#{amount} at #{interest}% APR, 
     paid over #{term} years:
  SUMMARY
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

  prompt('calculating')

  sleep(1)

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

  spacer

  loan_summary(loan_amount, annual_percentage_rate, term_in_years)

  spacer
  divider

  # Interpolating data into YAML file messages:
  # format(return_message(key), var_from_yml: data_to_interpolate)
  puts format(return_message('monthly_pmt'),
              payment: format('%.2f', monthly_payment))

  puts format(return_message('monthly_int'),
              interest: format('%.2f', monthly_percentage_rate)) + "%"

  puts format(return_message('loan_term_months'),
              months: term_in_months)

  divider
  spacer

  prompt('calculate_again')

  answer = gets.chomp.downcase

  if answer == 'y'
    system("clear")
  else
    break
  end
end

spacer
prompt('goodbye')
