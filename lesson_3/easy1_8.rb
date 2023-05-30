flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

info_array = flintstones.find {|k, _v| k == "Barney"}
p info_array

# Solution:
# flinstones.assoc("Barney")