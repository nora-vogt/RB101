# START

# # Given a collection of integers called "numbers"

# SET iterator = 1
# SET saved_number = value within numbers collection at space 1

# WHILE iterator <= length of numbers
#   SET current_number = value within numbers collection at space "iterator"
#   IF saved_number >= current_number
#     go to the next iteration
#   ELSE
#     saved_number = current_number

#   iterator = iterator + 1

# PRINT saved_number

# END

def find_greatest(numbers)
  return "Sorry, no numbers found." if numbers.nil? # guard clause, exit the method if the value of numbers is nil
  saved_number = numbers[0]

  numbers.each do |number|
    if number == nil || saved_number >= number  # skipping this iteration if there is a nil found in the array
      next
    else
      saved_number = number
    end
  end

  saved_number
end

numbers = [1, 5, 10, 8, 11, 4, 33]
nil_test = nil
numbers_with_nil = [1, nil, 5, 10, 8, 11, 4, 33]

puts find_greatest(numbers)
puts find_greatest(nil_test)
puts find_greatest(numbers_with_nil)

