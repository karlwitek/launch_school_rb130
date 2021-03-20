# Build a 'select' method that mirrors the behavior of Array#select.  Array#select method takes a block, then
# yields each element to the block. If the block evaluates to true, the current element will be included in the
# returned array. If false, then it will not be included in the returned array.

# example of Array#select method:

# array = [1, 2, 3, 4, 5]

# array.select { |num| num.odd? }       # => [1, 3, 5]
# array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
# array.select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

def select(array)
  counter = 0
  arr = []

  while counter < array.size
    value = yield(array[counter])
    if value
      arr << array[counter]
    end
    counter += 1
  end
  arr
  # return value!
end

array = [1, 2, 3, 4, 5]

# a = select(array) { |num| num.odd? }
# b = select(array) { |num| puts num }
# c = select(array) { |num| num + 1 }

# p a 
# p b 
# p c 

# 1  # output from 'puts'
# 2
# 3
# 4
# 5
# [1, 3, 5]
# []
# [1, 2, 3, 4, 5]

# LS solution:
def select(array)
  counter = 0
  result = []

  while counter < array.size
    current_element = array[counter]
    result << current_element if yield(current_element)
    counter += 1
  end

  result
end

# p select(array) { |n| n.odd? }# [1, 3, 5]

# Build a 'reduce' method:
# example of the reduce method:
# [1, 2, 3].reduce do |acc, num|
#   acc + num
# end
# => 6

# unlike the #each method, the reduce method yield two arguments to the block. The first argument is the
# accumulator object, and the second argument is the current element.
# The reduce method sets the accumulator to the return value of the block.  Then passes the accumulator to the
# block on the next yield.

# [1, 2, 3].reduce do |acc, num|
#   acc + num if num.odd?
# end

# => NoMethodError: undefined method `+' for nil:NilClass. When it got to 2, acc + num if num.odd? returned nil.
# The accumulator is now set to nil, and the next time reduce yielded to the block, the accumulator was passed to
# the block (which is now nil). (why we get the error).

# [1, 2, 3].reduce(10) do |acc, num|
#   acc + num
# end

# => 16
# Can initialize the accumulator to a default value. (starts with 10 in ex.)

def reduce(array, init_value = 0)
  counter = 0
  accum = init_value

  while counter < array.size
    accum = yield(accum, array[counter])
    counter += 1
  end
  accum
end

array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # NoMethodError (good)

# LS :

def reduce(array, default=0)
  counter = 0
  accumulator = default

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end

# The actual Enumerable#reduce method is far more flexible and powerful. It contains my features our reduce
# method doesn't consider.
# Our method (with a default value of 0) cannot be used if the data is non-numeric. In Enumerable#reduce, the 
# default value is the first element in the collection. Try to implement this improved default behavior.
# test cases: (below)

def reduce(array, default = array[0])
  counter = 0
  accumulator = default
  counter = 1 if accumulator.equal? array[0]

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end


p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']

p reduce(['a', 'b', 'c']) { |acc, value| acc + value }# 'abc'
p reduce([2, 3, 4]) { |acc, value|  acc * value }# 24

p reduce(['a', 'b', 'c'], 'a') { |acc, value| acc + value }
# changed code to use #equal? . (default value is same value but not 
# same object ) # aabc  (good)



