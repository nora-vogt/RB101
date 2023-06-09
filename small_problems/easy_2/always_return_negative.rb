def negative(num)
  num <= 0 ? num : num * -1
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby
p negative(0.5) == -0.5
p negative(-3.5) == -3.5

# From solution: can also just write -num