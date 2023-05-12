require 'yaml'
require 'pry'

# using a constant - Prompts are not expected to change
PROMPTS = YAML.load(File.read('calculator_config.yml'))

def msg(key) # testing for string interpolation
  PROMPTS[key]
end

def prompt(key)
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
              'Adding'
            when '2'
              'Subtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
  message
end

prompt(:welcome)
#prompt("Welcome to Calculator! Enter your name:")
name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end
binding.pry
format(msg(:greeting), name: name) # Need to figure out String Interpolation with YAML file!
#prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt(:first_num)
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt(:invalid_num)
    end
  end

  number2 = ''
  loop do
    prompt(:second_num)
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt(:invalid_num)
    end
  end

  # operator_prompt = <<-MSG
  #   What operation would you like to perform?
  #   1) add
  #   2) subtract
  #   3) multiply
  #   4) divide
  # MSG
  prompt(:choose_operation)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(:invalid_operator)
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

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

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Goodbye!")
