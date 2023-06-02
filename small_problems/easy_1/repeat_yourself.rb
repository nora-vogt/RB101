def repeat(string, number)
  number.times do
    puts string
  end
end

repeat("Hello", 3)
repeat("Hi", -1) # nothing will be printed