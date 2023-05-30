ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?("Spot")

# alternatives:
p ages.assoc("Spot") # returns nil
p ages.fetch("Spot", "Spot isn't in this hash!")
p ages.find {|k, _v| k == "Spot"}  # returns nil

# Solution:
p ages.key?("Spot")
p ages.include?("Spot")
p ages.member?("Spot")