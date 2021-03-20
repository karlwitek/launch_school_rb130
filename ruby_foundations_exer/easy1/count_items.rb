# Write a method that takes an array as an argument, and a block that returns true or false depending
# on the value of the array element passed to it. The method should return a count of the number of times
# the block returns true. May not use Array#count or Enumerable#count in your solution.
# examples:

# count([1,2,3,4,5]) { |value| value.odd? } == 3
# count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# count([1,2,3,4,5]) { |value| true } == 5
# count([1,2,3,4,5]) { |value| false } == 0
# count([]) { |value| value.even? } == 0
# count(%w(Four score and seven)) { |value| value.size == 5 } == 2

def count(array)
  total = 0
  array.each do |item|
    total += 1 if yield(item)
  end
  total
end

#puts count([1,2,3,4,5]) { |value| value.odd? }# == 3

puts count([1,2,3,4,5]) { |value| value.odd? } == 3
puts count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count([1,2,3,4,5]) { |value| true } == 5
puts count([1,2,3,4,5]) { |value| false } == 0
puts count([]) { |value| value.even? } == 0
puts count(%w(Four score and seven)) { |value| value.size == 5 } == 2
# (all true)
# LS :

# def count(array)
#   total = 0
#   array.each { |value| total += 1 if yield value }
#   total
# end

# Our solution works by iterating over the values in array(argument), incrementing a counter by 1 each
# time the block returns true when yielded the current value.
# FE: Write a version of the count method that meets the conditions of this exercise, but also does not
# use each, loop, while or until

def count(array)
  array.select { |item| yield(item) }.size
end

puts '====================='
puts count([1,2,3,4,5]) { |value| value.odd? } # 3

puts count([1,2,3,4,5]) { |value| value.odd? } == 3
puts count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
puts count([1,2,3,4,5]) { |value| true } == 5
puts count([1,2,3,4,5]) { |value| false } == 0
puts count([]) { |value| value.even? } == 0
puts count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# (all true)
