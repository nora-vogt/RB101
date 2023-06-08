print "What is the bill? "
bill = gets.to_f

print "What is the tip percentage? "
tip_percentage = gets.to_f

tip_rate = tip_percentage / 100
tip_amount = bill * tip_rate
total_bill = bill + tip_amount

puts "The tip is $#{format('%.2f', tip_amount)}"
puts "The total is $#{format('%.2f', total_bill)}"