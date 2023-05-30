# Core API Docs for 2.7.0 > Syntax > Calling Methods > Default Positional Arguments
# https://docs.ruby-lang.org/en/2.7.0/syntax/calling_methods_rdoc.html

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
# [4, 5, 3, 6]
# 1 is assigned to a, then
# 6 is assigned to d, then
# 5 is assigned to b, the first argument with a default value
# c uses its default value

def method2(a, b, c = "x", d = "y", e, f)
 p [a, b, c, d, e, f]
end

method2(1, 2, 3, 4)
# [1, 2, "x", "y", 3, 4]

def method3(a, b, c = "x", d = "y", e)
  p [a, b, c, d, e]
 end

 method3(1, 2, 3, 4)
 # [1, 2, 3, "y", 4]