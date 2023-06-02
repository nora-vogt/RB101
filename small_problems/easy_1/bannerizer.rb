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



print_in_box('To boldly go where no one has gone before.')
print_in_box('')

print_and_truncate_in_box("This is a really, really long string that is going to go off the screen, that's how long this string is")