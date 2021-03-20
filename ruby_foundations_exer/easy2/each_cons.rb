# The Enumerable#each_cons method iterates over the members of a collection taking each sequence of n 
# consecutive elements at a time and passing them to the associated block for processing. It then 
# returns a value of nil.
# Write each_cons that behaves similarly for Arrays, taking the elements 2 at a time. The method should
# take an array as an argument, and a block. It should yield each consecutive pair of elements to the
# block and return nil.
# examples:

# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# result == nil
# hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# hash == {}
# result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# hash == {'a' => 'b'}
# result == nil

def each_cons(array)
  index = 0
  while index < (array.size - 1) do
    yield(array[index], array[index + 1])
    index += 1
  end
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
# p result
# puts hash
# nil (note: while loop returns nil, don't need explicit nil return value in method)
# {1=>3, 3=>6, 6=>10}

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
puts result == nil
puts hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
puts hash == {}
puts result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
puts hash == {'a' => 'b'}
puts result == nil
# (all true)

# LS:

def each_cons(array)
  array.each_with_index do |item, index|
    break if index + 1 >= array.size
    yield(item, array[index + 1])
  end
  nil
end

# The hardest part of this exercise is trying to decide when to stop iterating. Cannot iterate over
# the entire array since there wouldn't be an element to pair with the last element if we did.
# We need to stop when the current element is the last element, which we can detect by comparing
# the value of index + 1 against the size of the array.

