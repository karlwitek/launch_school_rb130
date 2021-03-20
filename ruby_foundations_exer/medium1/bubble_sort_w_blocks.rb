# LS solution for the bubble_sort method.  Modify #bubble_sort! so it takes an optional block that 
# determines which of two consecutive elements will appear first in the results.

# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       swapped = true
#     end

#     break unless swapped
#   end
#   nil
# end

# method modified:

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
        array[index - 1], array[index] = array[index], array[index - 1]
      else
        next if array[index - 1] <= array[index]
        array[index - 1], array[index] = array[index], array[index - 1]
      end
      swapped = true
    end

    break unless swapped
  end
  nil
end

# examples/ test cases:

array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
puts array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
puts array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
puts array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
puts array == %w(alice bonnie Kim Pete rachel sue Tyler)
# true
# true
# true
# true
# true
# true

# LS:

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
      else
        next if array[index - 1] <= array[index]
      end

      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

# note line 83: this appears once, not twice (my solution)
# Nearly identical solution as original.  Need to yield two elements to the block if it was provided.
# If no block is given, just compare the two elements, and use that to determine if the two elements
# need to be swapped.

# Use Kernel#block_given? Regardless of whether a block is provided, we need to compare two elements.
# (the previous element in the array and the current element). If no block was given, we can compare
# the values directly using <=; otherwise, we need to yield both elements to the block, and examine
# the return value of the block.
# This technique of tweaking a general purpose method by passing it a block is quite common.  For
# instance, Enumerable#sort method usually used to sort Arrays accepts an optional block that can 
# be used to modify the desired sort sequence.  Similarly, Enumerable#max and #min take optional
# blocks to determine how elements of a collection are compared when determining the maximum and 
# minimum values.

# FE:
# Modify your solution so it only passes one element to the block at a time; the block should
# perform some sort of transformation to the argument, and #bubble_sort! itself should just
# use <= to compare two values. In other words, you should be able to call #bubble_sort! like
# this:

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |value| value.downcase }
# array == %w(alice bonnie Kim Pete rachel sue Tyler)

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if yield(array[index - 1]) <= yield(array[index])
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

puts "======================="
array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)# true

# line 121: yielding one element at a time to the block.

