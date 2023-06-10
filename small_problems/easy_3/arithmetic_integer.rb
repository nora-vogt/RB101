puts "==> Enter the first number:"
first_num = gets.to_i
puts "==> Enter the second number:"
second_num = gets.to_i

puts "==> #{first_num} + #{second_num} = #{first_num + second_num}"
puts "==> #{first_num} - #{second_num} = #{first_num - second_num}"
puts "==> #{first_num} * #{second_num} = #{first_num * second_num}"
puts "==> #{first_num} / #{second_num} = #{first_num / second_num}"
puts "==> #{first_num} % #{second_num} = #{first_num % second_num}"
puts "==> #{first_num} ** #{second_num} = #{first_num ** second_num}"

# Edge Cases + How to Handle:
# Second operand is zero:
  # Would have to create validation for division and remainder to ensure that second number is not zero
  # If it is, ask user to enter a non-zero number, repeat until valid

# Floats?
  # We would likely want to format the output / round the number of decimals displayed
  # We would also need to employ second number validation for division and remainder, to avoid scenarios where the second number may be rounded to zero - depends on allowed decimal points. ex: 0.23.round #=> 0

# We would need to implement loops + validation helper methods to accomplish this