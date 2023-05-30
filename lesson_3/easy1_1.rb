numbers = [1, 2, 2, 3]
numbers.uniq # returns [1, 2, 3] - a new Array object

puts numbers
# prints:
  # 1
  # 2
  # 2
  # 3

# Line 4 will print the elements of the original array as strings on their own line. The call to #uniq on line 2 did not mutate the calling array, and instead returned a new array.