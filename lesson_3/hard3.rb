# What will be printed by each?

#A)
def mess_with_vars(one, two, three)
  one = two #"two"
  two = three #"three"
  three = one #"one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three) # method returns "one"

puts "one is: #{one}" # one is: one
puts "two is: #{two}" # two is: two
puts "three is: #{three}" # three is: three

# Lines 5-7 of the method body all perform variable reassignment. The method parameter variables have their binding changed to reference the values pointed to by the provided variables - String Objects. The bindings of the local variables initialized outside the method are unchanged, they still reference the original String objects. 

#B)
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one is: one
puts "two is: #{two}" # two is: two
puts "three is: #{three}" # three is: three
# This is the same as the last one, instead of reassigning to reference values bound to variables, the method parameter variables are being reassigned to reference new String objects. 
# That reassignment doesn't change the bindings of the local vars one, two, three initialized outside the method. They still reference the original String objects.


#C)
def mess_with_vars(one, two, three)
  one.gsub!("one","two") # "two"
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one is: two
puts "two is: #{two}" # two is: three
puts "three is: #{three}" # three is: one

#The method invokes #gsub!, which is a destructive method, on the String objects referenced by the method param variables one, two, three. When mess_with_vars is invokes on line 53, the method parameters are bound to the same String objects that the local variables initialized outside the method reference. A reference to the original objects is passed in. 
# Lines 44-46 of the method body mutate the original String object by invoking gsub!. 
# Likes 55-57 will output the same original String objects, but with mutated values.