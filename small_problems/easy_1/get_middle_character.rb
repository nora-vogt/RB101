require 'pry'
def center_of(string)
  length = string.length
  if string.empty?
    return
  elsif length.odd?
    middle_index = length / 2
    string[middle_index]
  else
    middle_indexes = (((length / 2) - 1)..(length / 2))
    # From solution, can also use str[start, length]
    # string[center_index - 1, 2]
    string[middle_indexes]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
