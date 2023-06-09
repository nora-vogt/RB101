name = 'Bob'  # local variable name is initialized and assigned to a String object with a value of 'Bob'
save_name = name  # local variable save_name is initialized and assigned to the object that name references, which is the String object with a value of 'Bob'
name = 'Alice'  # name is reassigned to reference a new String object with a value of 'Alice'; the object referenced by save_name is unchanged
puts name, save_name  # Alice, Bob

# What does this code print out?
# Alice, Bob

name = 'Bob'  # Local variable 'name' is initialized and assigned to a string object with a value of 'Bob'
save_name = name  # Local variable 'save_name' is initialized and assigned to the object that name references, which is the same string Object with a value of 'Bob'
name.upcase!  # The String#upcase! method is called on the object referenced by name. #upcase! is a mutating method, and the value of the object referenced by name will change to 'BOB'
puts name, save_name  # #puts is invoked and passed two arguments - the object referenced by name and the object referenced by save_name
# BOB, BOB is printed
# Both name and save_name reference the same string object in memory - they are aliases for each other. When that object is mutated by the #upcase! call on line 12, the new value will be reflected when printing the value of both variables.