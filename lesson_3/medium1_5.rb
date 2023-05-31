limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Methods have self-contained scope - the method definition body does not have access to the limit variable initialized on line 1. Line 4 will raise an error due to limit being referenced. To fix this, we could define a third parameter and pass in the limit variable as an argument when invoking fib.