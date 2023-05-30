# keyword arguments follow any positional arguments and are separated by commas
# any keyword arguments not given will use default value from method definition

5.step(to: 10, by: 3) { |value| puts value }
# 5 
# 8

# step(by: step, to: limit) {|i| block } → self 
# :by is a "step" value (how much to increment by); :to is the limit