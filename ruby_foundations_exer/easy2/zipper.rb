# The Array#zip method takes two arrays, and combines them into a single array in which each element
# is a two-element array where the first element is a value from one array, and the second element is
# a value from the second array, in order.
# Write our own version of #zip. Takes two arrays as arguments, and returns a new array.
# (the original arrays should not be changed.) Assume both arrays have the same number of elements.

# example:
# zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]


def zip(arr1, arr2)
  result = []
  arr1.each_with_index do |elem, idx|
    result << [elem, arr2[idx]]
  end
  result
end

p zip([1, 2, 3], [4, 5, 6])# [[1, 4], [2, 5], [3, 6]]

# LS:

def zip(array1, array2)
  result = []
  index = 0
  length = array1.length
  while index < length
    result << [array1[index], array2[index]]
    index += 1
  end
  result
end

p zip([1, 2, 3], [4, 5, 6])

# LS: similar to my solution (alternate solution LS)

# def zipper(array1, array2)
#   result = []
#   array1.each_with_index do |element, index|
#     result << [element, array2[index]]
#   end
#   result
# end

# even more succintly:

# def zipper(array1, array2)
#   array1.each_with_index.with_object([]) do |(element, index), result|
#     result << [element, array2[index]]
#   end
# end

# The iteration part of this process is where everything of true importance happens. For this 
# problem, we iterate N times, where N is the number of elements in each of our two arrays.
# Then, during each iteration, we append the appropriate elements, as a two element Array, to our
# result array, and increment the index.  (better with #each_with_index)
