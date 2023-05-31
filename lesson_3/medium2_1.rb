a = "forty two"
b = "forty two"
c = a

puts a.object_id   # object_id (for example) is 100
puts b.object_id  # object_id (for example) is 120
puts c.object_id  # object_id is 100 - c references the same String object that a does; so same object_id