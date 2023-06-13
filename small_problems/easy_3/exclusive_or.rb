require 'pry'

def xor?(first, second)
  (first && !second) || (!first && second)
end

p xor?(5.even?, 4.even?) # == true
p xor?(5.odd?, 4.odd?) #== true
p xor?(5.odd?, 4.even?) #== false
p xor?(5.even?, 4.odd?) #== false
p xor?((3 > 5), (5 == 5)) #== true
p xor?(false, true) #== true
p xor?(true, false) #== true
p xor?(false, false) #== false
p xor?(true, true) #== false

# The ^ XOR is a bit-wise operator
# It only works properly when both values are numeric or both are boolean, otherwise can lead to unexpected results
