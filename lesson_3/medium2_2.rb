a = 42
b = 42
c = a

puts a.object_id  # object_id (for example) 10
puts b.object_id  # object_id 10
puts c.object_id  # object_id 10
# Integers are immutable objects; all three variables represent the same Integer objet with a value of 42 stored at memory address 10 (for example - number is made up)

# Notes from solution: In Ruby, each integer is a single immutable object (ex: there is only 1 integer 42, only 1 integer 100, etc).
# Any operation on an integer returns a new integer object
# The same is true for Booleans and Nil.