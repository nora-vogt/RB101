munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42 # family_member["age"] = family_member["age"] + 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

# Yes, the data in the hash will be changed for the values associated with keys "age" and "gender". This is because Hash#[]= is invoked within the mess_with_demographics method. Element assignment is a mutating method. 

# Solution: Need info about - Ruby passes the object_id of each argument to the method. demo_hash points to the same Hash object that munsters points to. When element assignment occurs on lines 11 + 12, it mutates the Hash object that both demo_hash and munsters references.