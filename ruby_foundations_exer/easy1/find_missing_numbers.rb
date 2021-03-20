# Write a method that takes a sorted array of integers as an argument, and returns an array that
# includes all of the missing integers(in order) between the first and last elements of the 
# argument.
# examples:

# missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# missing([1, 2, 3, 4]) == []
# missing([1, 5]) == [2, 3, 4]
# missing([6]) == []

def missing(array)
  result = []
  index = 0
  (array.size - 1).times do
    difference = array[index + 1] - array[index]
    if difference > 0 
      missing_num = array[index]
      (difference - 1).times do
        missing_num += 1
        result << missing_num
      end
    end
    index += 1
  end
  result
end


# puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# puts missing([1, 2, 3, 4]) == []
# puts missing([1, 5]) == [2, 3, 4]
# puts missing([6]) == []

# true
# true
# true
# true

# p missing([1, 5])  # [2, 3, 4]

# LS:

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

# puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# puts missing([1, 2, 3, 4]) == []
# puts missing([1, 5]) == [2, 3, 4]
# puts missing([6]) == []
# all true
# Enumerable#each_cons is handy when you need to iterate through consecutive, overlapping sequences.
# Enumerable#each_slice, by contrast, iterates through consecutive, non-overlapping sequences.
# Given the argument n, it takes every n consecutive elements from the subject collection, and
# iterates through each sequence of n consecutive items. We use #each_cons here for just such an
# operation, taking 2-number sequences from array. The block simply generates the list of numbers
# between each pair of numbers, and appends them to the result array.

# FE: Can you find other ways to solve this problem? What methods might prove useful? Can you find
# a way to solve this without using a method that requires a block?

# find a range from the first and last integers. convert to an array and then subtract the original 
# array:

def missing(array)
  full_array = (array[0]..array[-1]).to_a
  full_array - array
end

puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []

# true
# true
# true
# true
# student solutions:

# def missing(array)
#   (array.first..array.last).to_a - array
# end

# def missing(array)
#   missing = []
#   array[0].upto(array[-1]) do |number|
#   if array.include?(number)
#       next
#   else
#       missing << number
#   end
#   end
#   missing
# end
# end

# def missing(array)
#   (array.first..array.last).reject {|num| array.include?(num)}
# end

# recursive solution:

# def missing(arr, new_arr = [], i = 1)
#   return new_arr if i == arr.size

#   new_arr.concat([*(arr[i - 1] + 1)...arr[i]]) unless arr[i] - arr[i - 1] == 1

#   return missing(arr, new_arr, i + 1)
# end

# p missing([1, 5])# [2, 3, 4]
