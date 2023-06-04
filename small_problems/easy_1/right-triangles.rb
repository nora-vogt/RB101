def triangle(num)
  num.times do |i|
    puts "#{('*' * (i+1)).rjust(num)}"
  end
end

def upside_down_triangle(num)
  counter = num
  num.times do |i|
    puts "#{('*' * counter).rjust(num)}"
    counter -= 1
  end
end
triangle(5)
upside_down_triangle(5)

triangle(9)
upside_down_triangle(9)