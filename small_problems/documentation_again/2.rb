require 'date'

puts Date.civil   # -4712-01-01  -> everything defaults
puts Date.civil(2016)   # 2016-01-01    -> month, mday, start use defaults
puts Date.civil(2016, 5)  # 2016-05-01   -> mday, start use defaults
puts Date.civil(2016, 5, 13) # 2016-05-13  -> start uses defaults
Date.civil(1751, 5, 13, Date::ENGLAND) # nothing uses defaults

# Date counts BCE years astronomically. Year 0 -> year -1
# Month and day of month can be negative or positive number - negative counts backwards from end of year/month.

# Brackets in documentation mean that the arguments are optional
# civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date