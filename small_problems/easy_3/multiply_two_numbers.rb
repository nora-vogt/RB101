def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3) == 15
p multiply(10, 0) == 0
p multiply(-1, 10) == -10

# Further Exploration
p multiply([1, 2, 3], 2)

# If the first argument is an Array, it appears that Array#* will return a new array containing the specified number copies of the elements in the original array, with those elements appended at the end.

# From Docs: Array#*
# array * n → new_array
# array * string_separator → new_string
