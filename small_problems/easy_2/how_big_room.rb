# SQMETERS_TO_SQFEET = 10.7639
# puts ">> Enter the length of the room in meters:"
# length = gets.to_f

# puts ">> Enter the width of the room in meters:"
# width = gets.to_f

# square_meters = length * width
# square_feet = square_meters * SQMETERS_TO_SQFEET

# puts "The area of the room is #{format("%.2f", square_meters)} \
# square meters (#{format("%.2f", square_feet)} square feet)."

# Solution: Can also use Float#round to round results to 2 decimal places
# Make square meters -> square feet conversion number a constant

# Further Exploration
# Ask for input in feet, display: square feet, square inches, square centimeters
SQFEET_TO_SQINCHES = 144
SQINCHES_TO_SQCENTIMETERS = 6.4516

puts ">> Enter the length of the room in feet:"
length = gets.to_f

puts ">> Enter the width of the room in feet:"
width = gets.to_f

square_feet = (length * width).round(2)
square_inches = (square_feet * SQFEET_TO_SQINCHES).round(2)
square_centimeters = (square_inches * SQINCHES_TO_SQCENTIMETERS).round(2)

puts <<~HEREDOC
  The area of the room is #{square_feet} square feet.
  That's #{square_inches} square inches.
  Or #{square_centimeters} square centimeters.
HEREDOC
