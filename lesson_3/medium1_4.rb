def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element # adds new_element to end of the array; mutates array references by buffer
  buffer.shift if buffer.size > max_buffer_size # destructively deletes the first element of array if the buffer size is greater than max
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]  # concatenation - returns a new array, so buffer now references a different array, not the input array
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# The first method modifies the original buffer array that is passed in to the method. This method uses Array#<<, which is a destructive method. The array passed in as an argument will be mutated as new elements are added and old elements are displaced.

# The second method uses Array#+, which returns a new Array object. On line 1 of this method, the binding of buffer is changed - buffer now references a new array object, rather than the same object that the argument array references. Is is this new array object that will be modified by line 9, leaving the original array unchanged.

array = [1, 2, 3, 4]
rolling_buffer1(array, 4, "x")  # returns [2, 3, 4, "x"]
p array # [2, 3, 4, "x"]  # original array mutated


array = [1, 2, 3, 4]
rolling_buffer2(array, 4, "x") # returns [2, 3, 4, "x"]
p array # [1, 2, 3, 4]  # original array unchanged