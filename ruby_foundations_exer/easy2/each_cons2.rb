# For the previous exercise, our method handled 2 elements at a time. Enumerable#each_cons can actually
# handle any number of elements at a time.
# Update your method so it takes an argument that specifies how many elements should be processed at a time.
# examples:

# hash = {}
# each_cons([1, 3, 6, 10], 1) do |value|
#   hash[value] = true
# end
# hash == { 1 => true, 3 => true, 6 => true, 10 => true }

# hash = {}
# each_cons([1, 3, 6, 10], 2) do |value1, value2|
#   hash[value1] = value2
# end
# hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# each_cons([1, 3, 6, 10], 3) do |value1, *values|
#   hash[value1] = values
# end
# hash == { 1 => [3, 6], 3 => [6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 4) do |value1, *values|
#   hash[value1] = values
# end
# hash == { 1 => [3, 6, 10] }

# hash = {}
# each_cons([1, 3, 6, 10], 5) do |value1, *values|
#   hash[value1] = values
# end
# hash == {}

def each_cons(array, num_con_elements)
  start_idx = 0
  end_idx = num_con_elements - 1
  while end_idx < array.size do
    sub_arr = array[start_idx..end_idx]
    yield(sub_arr[0], *sub_arr[1..-1])# sending an array to yield is not correct?
    start_idx += 1
    end_idx += 1
  end
end
# need to send a parameter list instead of an array for 2nd argument of yield.
# This works, but really only need to send a list of arguments (one argument to yield, which is a list of 1 or
# more arguments)


hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
puts hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
puts hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
puts hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
puts hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
puts hash == {}

# false
# false
# false
# true
# not correct!!

# ADDED A * in front of sub_arr[1..-1] (*sub_arr[1..-1]) to turn an array into a list of arguements!!!
# Now the method works.

# true
# true
# true
# true
# true

# LS: 

def each_cons(array, n)
  array.each_index do |index|
    break if index + n -1 >= array.size
    yield(*array[index..(index + n - 1)])
  end
  nil
end

# (the * operator converts the array into a list of arguments)
# yield(*array[index..(index + n -1)]) converts the sliced array into a list of arguments. The list of argument
# yielded to the block of the method invocation.  It is a list of arguments, the block parameters handles this
# list the same as a normal method definition would. def some_method(first_num, *nums). Can think of the 
# (first_num, *nums) the same as |value1, *values| . value1 is assigned the first element, the rest are converted
# to an array.

puts '===================='
hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
puts hash == { 1 => [3, 6, 10] }# true

# Me: review my code. Sending two arguments to yield even when only need one. (arity rules)
# Is this the correct way?

# As before, you need to know when to stop iterating. This can be handled pretty easily by realizing that
# the previous exercise had n == 2, and we stopped processing when index + 1, (or index + 2 - 1) was
# greater than or equal to the Array size. This translates pretty naturally to testing whether index + n - 1
# is greater than or equal to the Array size.  Slightly trickier is passing a variable number of elements
# to the block; we do this using the 'splat' operator (*) together with a slice of the array that covers n
# elements starting at the current index.

# ??  LS solution sends (yields) one argument ( which is a list of arguments).  The way the block
# parameter works is similar to how a normal parameter works:
# def some_method(first_num, *nums)
# some_method(4, 5, 6, 7, 8, 9) (method invoked)
# first_num == 4, *nums == 5, 6, 7, 8 (actually turned into an array) [5, 6, 7, 8]
# need to test ( below)   YES!!

def test(first_num, *nums)
  puts "the first argument passed in is (first_num parameter) : #{first_num} "
  p nums
end

test(1, 5, 6, 7, 8, 9)
# the first argument passed in is (first_num parameter) : 1
# [5, 6, 7, 8, 9]

# Stack Overflow:  When you define a method, you can use the * operator to turn a list of arguments into
# an array.  Similarly, when you call a method, you can use the * operator to turn an array into a list of
# arguments.

test(*[11, 12, 13, 14])
# the first argument passed in is (first_num parameter) : 11
# [12, 13, 14]

# The * operator turned the array into a list of arguments first, then the method parameter(in definition)
# executed normally. (grabbed the first element for 'first_num' and converted the remaining elements into an
# array)



