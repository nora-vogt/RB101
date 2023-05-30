# 1. what is != and where should you use it?
  # != is the "not equal to" comparison operator. It checks if the two operands are not equal to each other and returns a boolean. Use it when you need to check if two values are not equal to each other and get a boolean return value, ex:
  6 != 4 # true


# 2. put ! before something, like !user_name
  # ! is the "NOT" operator, and writing !user_name will return the a boolean value that is the opposite of the expression's "boolean equivalent":
  # user_name is truthy, !user_name returns false


# 3. put ! after something, like words.uniq!
  # When there is ! at the end of a method call, this lets us know the method is a destructive method - it will mutate its caller. However, you can't just add ! to the end of any method to make it destructive. #uniq and #uniq! are two different defined Ruby methods.

# 4. put ? before something
  # You can't just put ? before something randomly? This would raise an error. ? on its own isn't a method call or an operator.
  # BUT, ? : is ther ternary operator - alternative to an if...else statement

# 5. put ? after something
  # You can't just add ? to the end of something - that would raise an error. However, in Ruby, there is a naming convention where methods that end in a ? commonly return a Boolean value (true or false). 
  # When writing a custom method, you can end your method name in ? to indicate the same.

# 6. put !! before something, like !!user_name
  # Two bang operators (!!) return an expression's "boolean equivalent". user_name is truthy -> !user_name returns false -> !false returns true


# From solution:
# ! or ? at the end of a method is part of the method name - a naming convention - NOT Ruby syntax. We don't really know waht the method is doing even when ending in those characters - it depends on the method implementation.
