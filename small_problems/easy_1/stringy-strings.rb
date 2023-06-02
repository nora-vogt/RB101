# def stringy(number)
#   string = ''
#   count = 0

#   while count < number
#     string << '1' if count.even?
#     string << '0' if count.odd?
#     count += 1
#   end

#   string
# end

# Further Exploration
def stringy(size, start_num = 1)
  string = ''
  size.times do |index|
    if start_num == 0
      number = index.even? ? '0' : '1'
      string << number
    else 
      number = index.even? ? '1' : '0'
      string << number
    end
  end

  string
end


puts stringy(6) == '101010' # true
puts stringy(9) == '101010101' # true
puts stringy(4) == '1010' # true
puts stringy(7) == '1010101' # true

puts stringy(6, 0) == '010101' # true
puts stringy(9, 0) == '010101010' # true
puts stringy(4, 0) == '0101' # true
puts stringy(7, 0) == '0101010' # true