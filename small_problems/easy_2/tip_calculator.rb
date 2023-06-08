print "What is the bill? "
bill = gets.to_f

print "What is the tip percentage? "
tip_percentage = gets.to_f

tip_rate = tip_percentage / 100
tip_amount = (bill * tip_rate).round(2)
total_bill = (bill + tip_amount).round(2)

puts "The tip is $#{tip_amount}"
puts "The total is $#{total_bill}"