a = [1, 4, 8, 11, 15, 19]

p a.bsearch { |num| num > 8 }

# bsearch {|x| block } → elem 
# block is required → returns an element from the calling array
# bsearch uses binary search: https://en.wikipedia.org/wiki/Binary_search_algorithm