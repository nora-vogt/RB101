answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer) # mess_with_it(42) returns 50

p answer - 8 # prints and returns 34