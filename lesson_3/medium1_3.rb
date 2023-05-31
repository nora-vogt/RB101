def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(20)
p factors(0)
p factors(-10)

# Bonus 1:
# number % divisor == 0 is the logic to check if the number can be evenly divided by the current divisor. If the statement evaluates to true, the number CAN be evenly divided by the divisor - and the number is thus a factor. If the statement evaluates to false, the number CANNOT be evenly divided by the divisor (there is a remainder) - and the divisor is not considered a factor of the number. 

# Bonus 2:
# Line 8 returns the value bound to the variable factors and is the return value of the factors method. This ensures that the Array object referenced by factors is returned from the method. Without this line, the while loop would be the last evaluated line of the method. While loops return nil, so this method would return nil rather than the desired array of factors.