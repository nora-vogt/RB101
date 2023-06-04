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

# MAYBE: try only slicing strings on line 1 if string.length > 76? 
  # then will also change line_padding logic
  # then try just doing the same kind of puts as in print_in_box method

  def print_with_word_wrap(string)
    string_slices = slice_string(string)
    line_padding = string.length > 76 ? 78 : (string.length + 2)
  
    horizontal_line = "+#{'-' * line_padding}+"
    empty_line = "|#{' ' * line_padding}|"
    
    puts horizontal_line
    puts empty_line
    string_slices.each do |str|
      if string.length > 76
        puts "| #{str.ljust(76)} |"
      else
        puts "| #{str} |"
      end
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
print_with_word_wrap(("z" * 77))