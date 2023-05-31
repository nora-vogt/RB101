def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)  # method will return ['pumpkins', 'rutabaga']

puts "My string looks like this now: #{my_string}"
# My string looks like this now: pumpkinsrutabaga

puts "My array looks like this now: #{my_array}"
# My array looks like this now: ["pumpkins"]

# When tricky_method_Two is invoked, an_array_param is bound to the same Array object that my_array references. Both variables reference the same Object. But on line 3, an_array_param is reassigned to reference a new Array object with the value of ['pumpkins', 'rutabaga']. This reassignment changes the binding only for an_array_param, it now references a different Array object. The Array object that my_array references is unchanged. 

# Line 2 is the same as the previous method - #<< is a destructive method, so the String object that both a_string_param and my_string reference will have its value changed, becoming 'pumpkinsrutabaga'