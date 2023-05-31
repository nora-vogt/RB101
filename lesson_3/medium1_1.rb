indentation = ""

10.times do |_i|
  puts indentation + "The Flintstones Rock!"
  indentation << " "
end

# Solution:
#10.times { |number| puts (" " * number) + "The Flintstones Rock!" }