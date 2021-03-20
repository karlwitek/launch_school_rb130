

def one?(collection)
  counter = 0
  collection.each do |item|
    counter += 1 if yield(item)
    return false if counter == 2
  end
  return true if counter == 1
  false
end

puts one?(['a', 'cbd', 'tre', 'ag']) { |str| str.size < 2 }# true

puts one?(['a', 'cbd', 'tre', 'ag']) { |str| str.size > 2 }# false
puts '+++++++++++++++++'

puts one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
puts one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
puts one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
puts one?([1, 3, 5, 7]) { |value| true }           # -> false
puts one?([1, 3, 5, 7]) { |value| false }          # -> false
puts one?([]) { |value| true }                     # -> false
# (all correct)

# LS:

def one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end

puts '============================'
puts one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
puts one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
puts one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
puts one?([1, 3, 5, 7]) { |value| true }           # -> false
puts one?([1, 3, 5, 7]) { |value| false }          # -> false
puts one?([]) { |value| true }                     # -> false

# (good) Use an each loop to iterate through the array, and a boolean local variable to keep track of 
# whether we have seen a matching element yet.  Each element is, in turn, yielded to the block; if the
# block returns a falsey value, we begin the next iteration. If the block returns a truthy value, we
# check to see if have previously seen a matching element; if we have, we need to return false.
# Otherwise, we note the fact that we have a matching element, and continue iterating through the array.
# Return true or false depending on whether we ever had a match. (after all iterations)
