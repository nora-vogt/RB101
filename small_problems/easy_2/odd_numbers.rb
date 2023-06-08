(1..99).each { |n| puts n if n.odd? }

# Further Exploration - Different Techniques

# Integer#upto
1.upto(99) { |num| puts num if num % 2 == 1}

# Array#select
puts Array(1..99).select { |n| n.odd? }

#Looping
n = 1

while n <= 99
  puts n
  n += 2
end