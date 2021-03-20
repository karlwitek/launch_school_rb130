# Write a method called none? that behaves similarly for Arrays.
# returns true if the block returns false for all of the element values. Otherwise, returns false
# Stop as soon as the block returns true.
# if empty, should return true

def none?(collection)
  collection.each { |item| return false if yield(item) }
  true
end

puts none?(['cat', 'dog', 'fish']) { |elem| elem.size > 5 }# true
puts none?(['cat', 'dog', 'fish']) { |elem| elem.size > 3 }# false

puts none?([1, 3, 5, 6]) { |value| value.even? } == false
puts none?([1, 3, 5, 7]) { |value| value.even? } == true
puts none?([2, 4, 6, 8]) { |value| value.odd? } == true
puts none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
puts none?([1, 3, 5, 7]) { |value| true } == false
puts none?([1, 3, 5, 7]) { |value| false } == true
puts none?([]) { |value| true } == true
# (all true)

# LS:
# same + alternate solution:
def none?(collection, &block)
  !any?(collection, &block)
end

def any?(collection)
  collection.each { |item| return true if yield(item) }
  false
end

puts '==============='
puts none?([1, 2, 3, 4]) { |el| el.even? }# false (needed #any? to be defined in this file)

# def none?(collection) # this fails (no block given (yield) (LocalJumpError))
#   !any?(collection)
# end

# Blocks aren't passed down the calling chain by default. Instead, you need to explicitly pass the block
# to #any?; to do that, #none? must require a block argument with an & as shown in the alternate solution.
# We then pass &block to any?, where it is treated as if the call to any? included the block.



