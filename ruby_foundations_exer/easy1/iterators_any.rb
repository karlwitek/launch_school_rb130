# Write a method called any? that behaves similarly for Arrays. It should take an Array as an argument, and 
# a block. It should return true if the block returns true for any of the element values. Otherwise, it 
# should return false. Stop processing elements of the Array as soon as the block returns true.
# If the array is empty, should return false, regardless of how the block is defined.
# May not use any of the standard ruby methods (any?, all?, none?, one?)

def any?(array)
  return false if array.empty?
  array.each do |element|
    return true if yield(element)
  end
  false
end


# puts any?([1, 4, 5, 6]) { |value| value.even? } == true
# puts any?([1, 3, 5, 7]) { |value| value.even? } == false
# puts any?([2, 4, 6, 8]) { |value| value.odd? } == false
# puts any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# puts any?([1, 3, 5, 7]) { |value| true } == true
# puts any?([1, 3, 5, 7]) { |value| false } == false
# puts any?([]) { |value| true } == false

# try with a Hash:
puts any?({ 1 => 'abc', 2 => 'defg', 3 => 'hijk' }) { |k, v| v.size > 3 }# true

# true
# true
# true
# true
# true
# true
# true

# LS:
# def any?(collection)
#   collection.each { |item| return true if yield(item) }
#   false
# end

# The solution simply iterates through our collection, and returns true the first time it encounters an
# item that produces a true result when it is yielded to the block, if no such item is encountered,
# we return false.
# FE: Our solution used Enumerable#each for the main loop. The advantage is that any? will work with any
# Enumerable collection, including Arrays, Hashes, Sets and more.  Even though we only need any? to work
# with Arrays, we get additional functionality for free.
# Does your solution work with other collections like Hashes or Sets? ( see above (yes))

