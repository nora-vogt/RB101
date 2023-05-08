NUMBERS = [1, 2, 3]
arr = [1, 2, 3]

def test
  puts NUMBERS.inspect
  puts arr.inspect
end

test

# => [1, 2, 3]
# => NameError: undefined local variable or method `arr'


# The test method can acess the constant but not the local variable, because constants have different scoping rules than local vars. To be continued! 