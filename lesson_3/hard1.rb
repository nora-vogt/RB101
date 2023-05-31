if false
  greeting = "hello world"
end

greeting  # actually returns nil
# An exception will be raised by line 5. false is falsy - it always evaluates to false. Therefore, there is no way for the if statement to evaluate to true and execute the variable initialization and assignment on line 2. 

# INCORRECT - solution:
# This is what typically happens. BUT, when you initialize a local variable within an if clause, the variable is initialized with a value of a nil if the if clause doesn't get executed. 