# The Enumerable#drop_while method begins by iterating over the members of a collection, passing each element to
# the associated block until if finds an element for which the block returns false or nil. It then converts the
# remaining elements of the collection(including the element that resulted in a falsey return) to an array,
# and returns the result.
# Write a method called drop_while that behaves similarly for Arrays. Takes an array as an argument, and a block.
# It should return all the elements of the Array, except those elements at the beginning of the Array that produce
# a truthy value when passed to the block. If the array is empty, or if the block returns a truthy value for
# every element, return an empyt array.
# examples:

# drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]# not a typo (converts the remaining elements)
# drop_while([1, 3, 5, 6]) { |value| true } == []
# drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# drop_while([]) { |value| true } == []

def drop_while(array)
  result = []
  false_found = false
  array.each do |item|
     if yield(item) && !false_found
      next
     else
      false_found = true
      result << item
     end
    end
    result
end

# p drop_while([1, 3, 5, 6]) { |value| value.odd? }# [6] (good)

puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
puts drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]# not a typo (converts the remaining elements)
puts drop_while([1, 3, 5, 6]) { |value| true } == []
puts drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
puts drop_while([]) { |value| true } == []
# (all true)

# LS:

def drop_while(array)
  index = 0
  while index < array.size && yield(array[index])
    index += 1
  end
  array[index..-1]
end

puts drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
puts drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]# not a typo (converts the remaining elements)
puts drop_while([1, 3, 5, 6]) { |value| true } == []
puts drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
puts drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
puts drop_while([]) { |value| true } == []

# Uses a simple while loop. while makes it obvious that we want to stop prematurely, since we know that we
# may not be itertating through the entire array.
# Once we've skipped over the elements for which the block returns true, all we need to do is extract the
# remaining elements from the Array, which we do with array[index..-1]; this slicing syntax extracts a slice
# of the array starting at index, and ending with the final element at index -1.

