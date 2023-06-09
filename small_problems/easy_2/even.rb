(1..99).each {|n| puts n if n.even?}

#Alternatives
# Looping
count = 1

while count <= 99
  puts count if count % 2 == 0
  count += 1
end

# Range#select
puts ((1..99).select {|n| n.even?})

# Integer#upto
1.upto(99) { |n| puts n if n % 2 == 0}

