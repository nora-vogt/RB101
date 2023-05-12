require 'yaml'
require 'pry'

# using a constant - Prompts are not expected to change
PROMPTS = YAML.load(File.read('calculator_config.yml'))

def return_msg(key) # return the value of messages from YAML file to use with Kernel#format + string interpolation
  PROMPTS[key]
end

def print_msg(key) # print messages from YAML file
  Kernel.puts("#{PROMPTS[key]}")
end

def integer?(num)
    num.to_i.to_s == num
end

def float?(num)
    num.to_f.to_s == num  # works but misses Digit. floats (1.)
end

def number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  message = case op
            when '1'
              return_msg(:adding)
            when '2'
              return_msg(:subtracting)
            when '3'
              return_msg(:multiplying)
            when '4'
              return_msg(:dividing)
            end
  message
end

print_msg(:welcome)

user_name = ''
loop do
  user_name = Kernel.gets().chomp()

  if user_name.empty?()
    print_msg("Make sure to use a valid name.")
  else
    break
  end
end

puts format(return_msg(:greeting), name: user_name)

loop do # main loop
  number1 = ''
  loop do
    print_msg(:first_num)
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      print_msg(:invalid_num)
    end
  end

  number2 = ''
  loop do
    print_msg(:second_num)
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      print_msg(:invalid_num)
    end
  end

  print_msg(:choose_operation)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      print_msg(:invalid_operator)
    end
  end

  puts format(return_msg(:display_operation), op_name_as_verb: operation_to_message(operator))

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
            if number2.to_i == 0
              0
            else
              number1.to_i() / number2.to_i()
            end
           end

  puts format(return_msg(:result), answer: result)

  print_msg(:again?)
  answer = Kernel.gets().chomp()
  break unless answer.downcase == 'y'
end

print_msg(:goodbye)
