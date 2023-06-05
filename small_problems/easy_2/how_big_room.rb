puts ">> Enter the length of the room in meters:"
length = gets.to_f

puts ">> Enter the width of the room in meters:"
width = gets.to_f

square_meters = length * width
square_feet = square_meters * 10.7639

puts "The area of the room is #{format("%.1f", square_meters)} \
square meters (#{format("%.2f", square_feet)} square feet)."

# Solution: Can also use Float#round to round results to 2 decimal places