# def reversed_number(num)
#   num.to_s.reverse.to_i
# end

# Implementation without using #reverse
def reversed_number(num)
  reversed_str = ""
  num.to_s.each_char do |char|
    reversed_str.prepend(char)
  end

  reversed_str.to_i
end

# def reversed_number(num)
#   reversed_str = ""
#   num.to_s.each_char { |char| reversed_str.prepend(char) }

#   reversed_str.to_i
# end

p reversed_number(12345)
p reversed_number(12345) == 54321

p reversed_number(12213)
p reversed_number(12213) == 31221
p reversed_number(456) == 654

p reversed_number(12000)
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1