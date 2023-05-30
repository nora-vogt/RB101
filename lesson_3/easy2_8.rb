advice = "Few things in life are as important as house training your pet dinosaur."
#sliced_string = advice.slice!("Few things in life are as important as ")
# p advice #=> "house training your pet dinosaur."

# if advice.slice("Few things in life are as important as ") were used instead, 
# The String object bound to advice would be unchanged, same value
# sliced_string would reference a new String object with a value of "Few things in life are as important as "

sliced_string = advice.slice("Few things in life are as important as ")
puts advice
puts sliced_string

# Solution:
# advice.slice!(0, advice.index('house')) # #index returns 39, the index where the substring 'house' begins