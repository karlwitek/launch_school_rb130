# The Enumerable#each_with_object method iterates over the members of a collection, passing each element and
# an arbitrary object (usually a collection) to the associated block. The return value of the block is not used.
# The object that is passed to the block is defined as an argument to each_with_object; with each iteration
# this object may be updated by the block. When iteration is complete, the final value of the object is returned.
# Write a method called each_with_object that behaves similarly for Arrays. Takes an array and an object of some
# sort as an argument, and a block.  It should yield each element and the object to the block. each_with_object
# should return the final value of the object.
# examples:

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# result == {}

def each_with_object(array, object)
  array.each do |item|
    # object << yield(item, object)# not correct (return value of the block is NOT used)
    yield(item, object)# good. not using the return value, just yielding. (me)
  end
  object
end


# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result#  [1, [...], 9, [...], 25, [...]] (not correct, should be [1, 9, 25])
# [1, 9, 25] (after change in code)


result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
puts result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
puts result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
puts result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
puts result == {}

# (all true)
# LS:

def each_with_object(array, object)
  array.each { |item| yield(item, object) }
  object
end

# All we need to do with that object is yield it(along with the element value) to our block for each
# element in the array. At the end, we just need to make sure we return that object.

