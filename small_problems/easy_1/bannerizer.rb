def print_in_box(string)
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