# all? returns true the block returns a value of true for every element in the collection. Otherwise, all?
# returns false. Stop searching the first time the block returns false.
# Write a method called all? that behaves similarly for Arrays. Should return true if the array is empty.

def all?(collection)
  collection.each { |item| return false if !yield(item) }
  true
end

puts all?([2, 4, 6, 8]) { |elem| elem.even? }# true
puts all?([2, 4, 6, 7]) { |elem| elem.even? }# false

puts all?([1, 3, 5, 6]) { |value| value.odd? } == false
puts all?([1, 3, 5, 7]) { |value| value.odd? } == true
puts all?([2, 4, 6, 8]) { |value| value.even? } == true
puts all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts all?([1, 3, 5, 7]) { |value| true } == true
puts all?([1, 3, 5, 7]) { |value| false } == false
puts all?([]) { |value| false } == true
# (all true)

# LS:

def all?(collection)
  collection.each { |item| return false unless yield(item) }
  true
end

puts all?([4, 2, 6, 7]) { |num| num.even? }# false

# Similar to our solution for any? Iterates through our collection, and returns false if it encounters
# an item that produces a false result when it is yielded to the block. If no such item is encountered,
# we return true.

