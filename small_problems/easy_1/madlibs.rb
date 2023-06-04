print ">> Enter a noun: "
noun = gets.chomp

print ">> Enter a verb: "
verb = gets.chomp

print ">> Enter an adjective: "
adjective = gets.chomp

print ">> Enter an adverb: "
adverb = gets.chomp

madlib_1 = "I #{adverb} #{verb} my #{adjective} #{noun}. Weird!"
madlib_2 = "Yesterday, the #{adjective} #{noun} #{verb} #{adverb}. Did you see?"
madlib_3 = "While you #{verb}, #{adverb} check the #{adjective} #{noun}."

puts [madlib_1, madlib_2, madlib_3].sample
