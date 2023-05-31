def foo(param = "no") # this is a bit of a red herring; the param variable is unused within the foo method - it always returns "yes"
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo)
# bar("yes")
# "yes" == "yes" : "no"
# returns "no"