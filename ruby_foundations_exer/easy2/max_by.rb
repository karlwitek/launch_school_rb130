# The Enumerable#max_by method iterates over the members of a collection, passing each element to the
# associated block. It then returns the element for which the block returned the largest value.
# Write max_by. Takes an array and a block, and returns the element that contains the largest value.
# If the array is empty, should return nil. ( max_by behaves similarly for Arrays)
# examples:

# max_by([1, 5, 3]) { |value| value + 2 } == 5
# max_by([1, 5, 3]) { |value| 9 - value } == 1
# max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# max_by([-7]) { |value| value * 3 } == -7
# max_by([]) { |value| value + 5 } == nil

def max_by(array)
  return nil if array.empty?
  largest_element = array[0]
  value = yield(array[0])
  array.each do |item|
    current_value = yield(item)
    if current_value > value
      value = current_value
      largest_element = item
    end
  end
  largest_element
end

# puts max_by([1, 5, 3]) { |value| value + 2 }#  5

puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil
# (all true, not first line in method (return nil if..))

# LS:

# def max_by(array)
#   return nil if array.empty?

#   max_element = array.first
#   largest = yield(max_element)

#   array[1..-1].each do |item|
#     yielded_value = yield(item)
#     if largest < yielded_value
#       largest = yielded_value
#       max_element = item
#     end
#   end

#   max_element
# end

# First part handles the edge case of an empty array (same as my solution). Then we need to select a 
# reasonable initial value to be compared against each block return value, then we need to iterate
# over the array while keeping track of both the largest value returned by the block, and the value
# of the element associated with that largest value.
# The answer to the first part is to pass the first item in the array to the block, and then use the
# return value as the initial largest value.( 0 will not work, neg infinitiy won't work with strings)
# Second part: remember which element returned the largest value to date. Track this element in 
# max_element, which we initialize to the first element of the array.
# Once the plan is in place, all we need to do is to iterate through the remaining array elements
# (array[1..-1].each) and find the largest block return value and its associated element.


