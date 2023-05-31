# call a method
# pass two strings as arguments
# see how they are treated differently by the methods

def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga" # #+= is reassignment; binds string_param_one to a new String object w/ value "pumpkinsrutatbaga"
  string_param_two << "rutabaga" # #<< is destructive; mutates string referenced by string_param_two
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}"
# String_arg_one looks like this now: pumpkins


puts "String_arg_two looks like this now: #{string_arg_two}"
# String_arg_two looks like this now: pumpkinsrutabaga

# Line 6 of the method utilizes reassignment "concatenate and assign" - looks like a method but isn't. string_param_one = string_param_one + "rutabaga". This type of concatenation returns a new string rather than mutating, and string_param_one is bound to a new String object. The original string referenced by string_param_one is unchanged.

# Line 7 invokes a destructive method #<< - this method mutates the String object that string_param_two references, appending "rutabaga" to the String. string_param_two is an alias for string_arg_two - they both reference the same String object, which is now mutated after the tricky_method call on line 12.

# Language from Solution: 
  #"The string arguments are passed to the method as references to objects of type String"
  # ""