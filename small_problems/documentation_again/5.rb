a = %w(a b c d e)
puts a.fetch(7) # IndexError - there is no element at index position 7
puts a.fetch(7, 'beats me') # beats me (default value when IndexError is encountered)
puts a.fetch(7) { |index| index**2 } # 49
# The block will only be executed when an invalid index is referenced
