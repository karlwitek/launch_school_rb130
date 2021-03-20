# The Enumerable#count method iterates over the members of a collection, passing each element to the 
# associated block. It then returns the number of elements for which the block returns a truthy value.
# Write a method called count that behaves similarly for an arbitrarily long list of arguments. It should
# take 0 or more arguments and a block, and then return the total number of arguments for which the block
# returns true. If the argument list is empty, count should return 0.
# examples:

# count(1, 3, 6) { |value| value.odd? } == 2
# count(1, 3, 6) { |value| value.even? } == 1
# count(1, 3, 6) { |value| value > 6 } == 0
# count(1, 3, 6) { |value| true } == 3
# count() { |value| true } == 0
# count(1, 3, 6) { |value| value - 6 } == 3

def count(*args)
  total = 0
  args.each { |arg| total += 1 if yield(arg) }
  total
end

# puts count(1, 3, 6) { |value| value.odd? }# 2

puts count(1, 3, 6) { |value| value.odd? } == 2
puts count(1, 3, 6) { |value| value.even? } == 1
puts count(1, 3, 6) { |value| value > 6 } == 0
puts count(1, 3, 6) { |value| true } == 3
puts count() { |value| true } == 0
puts count(1, 3, 6) { |value| value - 6 } == 3

# (all true)

# LS:

# def count(*arguments)
#   total = 0
#   arguments.each { |item| total += 1 if yield(item) }
#   total
# end

# Our solution simply iterates through the arguments, incrementing our total each time yield(item)
# returns a truthy value.  Note, we use *arguments in the method definition; this lets us treat the
# list of arguments as an array of values, which means the rest of our count method does not need
# to change( other than the change in variable name)
