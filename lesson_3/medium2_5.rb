# def tricky_method(param, vegetable)
#   param += vegetable
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# my_string = tricky_method(my_string, "pumpkins")
# my_array = tricky_method(my_array, ["rutabaga"])

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

# Solution:
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# The explicit return is necessary; it collects both values into an array and returns it. The method throws an error without the explicit return. 

# To make things more clear, we could put both values into an array literal to make explicit what's happening with the return value: [a_string_param, an array_param]