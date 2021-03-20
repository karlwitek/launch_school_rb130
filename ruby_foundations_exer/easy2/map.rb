# Enumerable#map method iterates over the members of a collection... The returned values from the block
# are then built up into an Array that is then returned to the caller.  Every time #map yields to the
# block, it obtains just one value. May be a complex value, or even another collection, but it is just one
# value. Thus, #map returns the same number of elements that the original collection had.

# Write a method called map that behaves similarly for Arrays.  Takes an array as an argument, and a block.
# Return a new array that contains the return values produced by the block for each element in the 
# original array.
# if the array is empty, map should return an empty Array, regardless of how the block is defined.
# Ok to use each, each_with_object, each_with_index, inject, loop, for, while, until to iterate
# through the collection. No other methods.
# examples:

# map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# map([]) { |value| true } == []
# map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]


def map(array)
  result = []
  array.each { |item| result << yield(item) }
  result
end

# p map([1, 3, 6]) { |value| value**2 }# [1, 9, 36] ( good )


puts map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
puts map([]) { |value| true } == []
puts map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
puts map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
puts map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
# (all true)

# LS: (same as my solution)

# def map(array)
#   result = []
#   array.each { |item| result << yield(item) }
#   result
# end

# simply iterates through the array, and appends the return value of yield(item) to our result array.

# FE: Does your solution work with other collections like Hashes or Sets?

hash = { 1 => 'apple', 2 => 'pear', 3 => 'peach' }

p map(hash) { |k, v| v[0] == 'p' }# [false, true, true] ( block not a good example)

p map(hash) { |key, val| val.capitalize }# ["Apple", "Pear", "Peach"]

p hash# {1=>"apple", 2=>"pear", 3=>"peach"}

p map(hash) { |key, val| val.capitalize! }

p hash# {1=>"Apple", 2=>"Pear", 3=>"Peach"}  ( ! mutated values in the hash )



