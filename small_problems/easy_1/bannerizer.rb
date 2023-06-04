require 'pry'

def print_in_box(string)
  horizontal_line = "+#{'-' * (string.length + 2)}+"
  empty_line = "|#{' ' * (string.length + 2)}|"

  puts horizontal_line
  puts empty_line
  puts "| #{string} |"
  puts empty_line
  puts horizontal_line
end

def print_and_truncate_in_box(string)
  string = string[0..75] if string.length > 76  
  horizontal_line = "+#{'-' * (string.length + 2)}+"
  empty_line = "|#{' ' * (string.length + 2)}|"

  puts horizontal_line
  puts empty_line
  puts "| #{string} |"
  puts empty_line
  puts horizontal_line
end

def slice_string(string)
  sliced_strings = []
  cloned_string = string.clone
  
  until cloned_string.empty?
    sliced_strings << cloned_string.slice!(0..75)
  end
  sliced_strings
end

# def slice_string(string)
#   sliced_strings = []
#   start_range = 0
#   end_range = 75

#   until end_range >= string.length + 74
#     sliced_strings << string.slice(start_range..end_range)
#     start_range += 75
#     end_range += 75
#     # currently only iterating 3 times; need different condition to catch the last split - there should be 4
#     # also: don't want to include empty spaces in last split
#   end
#   sliced_strings
# end

def print_with_word_wrap(string)
  string_slices = slice_string(string)
  horizontal_line = "+#{'-' * (78)}+"
  empty_line = "|#{' ' * (78)}|"
  
  puts horizontal_line
  puts empty_line
  string_slices.each do |str|
    puts "| #{str.ljust(76)} |"
  end
  puts empty_line
  puts horizontal_line
end


# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')

# print_and_truncate_in_box("This is a really, really long string that is going to go off the screen, that's how long this string is. It never ends! That's the string! This is a really, really long string that is going to go off the screen, that's how long this string is. It never ends! That's the string!")

long_string = "This is a really, really long string that is going to go off the screen, that's how long this string is. It never ends! That's the string! This is a really, really long string that is going to go off the screen, that's how long this string is. It never ends! That's the string!"

print_with_word_wrap(long_string)
print_with_word_wrap("")
print_with_word_wrap("Tiny string.")
print_with_word_wrap(("*" * 160))