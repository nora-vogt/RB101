numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # deletes the element at the specified index, in this case, index 1. 2 will be deleted and returned.
p numbers # [1, 3, 4, 5]

numbers = [1, 2, 3, 4, 5]
numbers.delete(1) # deletes all instances of the specified value from an array, returns that value
p numbers # [2, 3, 4, 5]

# Note from solution: both methods are mutating, but do not have a ! at the end of the method name.