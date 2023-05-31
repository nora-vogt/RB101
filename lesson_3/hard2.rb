greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # { a: 'hi there'}

# On line 2, informal_greeting is initialized and bound to the object that is returned by referencing the value associated with key :a in the greetings hash (String object with a value of 'hi')
# Line 3 mutates that same String object with the shovel operator #<<, changing the value fo "hi there". 
# Lines 5 and 6: both greetings and informal_greetings include references to the same String object

# What if we wanted to modify only informal_greeting, but not greetings?
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
#informal_greeting += ' there'
# or
informal_greeting = greetings[:a] + " there"
# or from solution: informal_greeting = greetings[:a].clone


puts informal_greeting  #  => "hi there"
puts greetings # { a: 'hi'}
