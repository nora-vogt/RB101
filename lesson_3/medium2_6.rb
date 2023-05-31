# def color_valid(color)
#   if color == "blue" || color == "green"
#     true
#   else
#     false
#   end
# end

# How to simplify? Use a ternary operator:
def color_valid(color)
  (color == "blue" || color == "green") ? true : false
end

# Solution - ternary isn't even necessary; the || operator will return a boolean

def color_valid(color)
  color == "blue" || color == "green"
end