require 'pry'

def print_in_box(string)
  horizontal_line = "+#{'-' * (string.length + 2)}+"
  spacer_line = "|#{' ' * (string.length + 2)}|"

  puts horizontal_line
  puts spacer_line
  puts "| #{string} |"
  puts spacer_line
  puts horizontal_line
end

def print_and_truncate_in_box(string)
  string = string[0..75] if string.length > 76  
  horizontal_line = "+#{'-' * (string.length + 2)}+"
  spacer_line = "|#{' ' * (string.length + 2)}|"

  puts horizontal_line
  puts spacer_line
  puts "| #{string} |"
  puts spacer_line
  puts horizontal_line
end

# Check if string is longer than 76 characters
# If yes, split the string into 76-character long increments
# Save those splits to an array
# On print string line - iterate through array of split strings
# Print each split on its own line

# string.length == 277
# first pass: end range 75
# second pass: end range 150
# third pass: end range 225
# fourth pass: end range 300 - this is currently not running, but we need it to run and be the last pass

# IDea: have some kind of countdown variable? start at string.length
# each time, decrement it by 75
# end looping if the countdown variable is ????

# or add numbers into conditional?? while/until end_range is more than 75 greater than string.length. or string.length + 75??

# NEW:
# for this method, could try
# string = string.copy (reassign string to new object w/ copy value)
# iterate with string.slice! 
# stop iterating when string.empty?
# then, in the print_method, have an if statement: if string.length < 75 - then use #ljust or something similar to pad the end of the string with spaces until it gets to 76

def slice_string(string)
  sliced_strings = []
  start_range = 0
  end_range = 75

  until end_range >= string.length + 74
    sliced_strings << string.slice(start_range..end_range)
    start_range += 75
    end_range += 75
    # currently only iterating 3 times; need different condition to catch the last split - there should be 4
    # also: don't want to include empty spaces in last split
  end
  sliced_strings
end


# working except for last string split - need to pad it with spaces!
def print_word_wrap(string)
  string_slices = slice_string(string)
  horizontal_line = "+#{'-' * (78)}+"
  spacer_line = "|#{' ' * (78)}|"
  
  puts horizontal_line
  puts spacer_line
  string_slices.each do |str|
    puts "| #{str.ljust(76)} |"
  end
  puts spacer_line
  puts horizontal_line
end


# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')

# print_and_truncate_in_box("This is a really, really long string that is going to go off the screen, that's how long this string is. It never ends! That's the string! This is a really, really long string that is going to go off the screen, that's how long this string is. It never ends! That's the string!")

long_string = "This is a really, really long string that is going to go off the screen, that's how long this string is. It never ends! That's the string! This is a really, really long string that is going to go off the screen, that's how long this string is. It never ends! That's the string!"

print_word_wrap(long_string)