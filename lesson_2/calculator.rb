require 'yaml'
require 'pry'

MESSAGES = YAML.load_file('calculator_messages.yml')

def every_lang_message(key)
  MESSAGES[key].each {|str| puts "=> #{str}"}
end

def message(key, language)
  MESSAGES[language][key]
end

def print_msg(key, language) 
  puts "=> #{message(key, language)}"
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

def operation_to_message(op, language)
  message = case op
            when '1'
              message(:adding, language)
            when '2'
              message(:subtracting, language)
            when '3'
              message(:multiplying, language)
            when '4'
              message(:dividing, language)
            end
  message
end

every_lang_message(:welcome)

puts MESSAGES[:choose_lang]

language = ''
loop do
  lang_choice = Kernel.gets().chomp()

  if %[1 2].include?(lang_choice)
    language = 'en' if lang_choice == '1'
    language = 'es' if lang_choice == '2'
    break
  else
    every_lang_message(:invalid_lang)
  end
end

print_msg(:enter_name, language)
user_name = ''
loop do
  user_name = Kernel.gets().chomp()

  if user_name.empty?()
    print_msg(:need_valid_name, language)
  else
    break
  end
end

# format(message(key_from_yaml), var_name_from_yaml: local_var)
puts format(message(:greeting, language), name: user_name)

loop do # main loop
  number1 = ''
  loop do
    print_msg(:first_num, language)
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      print_msg(:invalid_num, language)
    end
  end

  number2 = ''
  loop do
    print_msg(:second_num, language)
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      print_msg(:invalid_num, language)
    end
  end

  print_msg(:choose_operation, language)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      print_msg(:invalid_operator, language)
    end
  end

  puts format(message(:display_operation, language), op_name_as_verb: operation_to_message(operator, language))

  sleep(1)

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

  puts format(message(:result, language), answer: result)

  print_msg(:again?, language)
  answer = Kernel.gets().chomp()
  break unless answer.downcase == 'y'
end

print_msg(:goodbye, language)
