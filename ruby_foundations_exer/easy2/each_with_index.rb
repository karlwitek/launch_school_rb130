# The Enumerable#each_with_index method iterates over the members of a collection, passing
# each element and its index to the associated block. The value returned by the block is not used.
# #each_with_index returns a reference to the original collection.
# Write a method called each_with_index that behaves similarly for arrays. Takes an array as an 
# argument, and a block.  It should yield each element and an index to the block. The method should
# return a reference to the original array.
# example:

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]
# should return:

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true

def each_with_index(array)
  index = 0
  array.each do |element|
    yield(element, index)# note the order is important (matches order of block parameters in block below)
    index += 1
  end
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true

# LS: (same, EXCEPT FOR RETURN VALUE)

# def each_with_index(array)
#   index = 0
#   array.each do |item|
#     yield(item, index)
#     index += 1
#   end
# end

# Uses each to iterate through the array, while maintaining an index value that can be passed with the
# element value to the block.
# In LS solution , the return value is last statement executed (the each loop), and each returns the
# array that it is used on, so the return value is array, just what we need.  
