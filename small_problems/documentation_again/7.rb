s = 'abc'
puts s.public_methods(false).inspect
# prints all public methods available to the instance of String class 's'
  # includes String class instance methods
  # also methods inheritd from Object (which inherits other methods from BasicObject and Kernel)

# Modify code to print just public methods defined or overridden by String class (exclude: Object, BasicObject, Kernel)

# to check for not the instance of the string, but just the String class
# String.public_instance_methods(false)
# also: s.public_methods(false) == String.public_instance_methods(false) # true