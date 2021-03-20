# The Range#step method lets you iterate over a range of values where each value in the iteration is
# the previous value plus a 'step' value. It returns the original range.
# Write a method that does the same thing as Range#step, but does not operate on a range. Instead,
# your method should take 3 arguments: the starting value, ending value, and the step value to be
# applied to each iteration.  Your method should also take a block to which it will yield(or call)
# successive iteration values.
# examples:

# step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10
# What do you think would be a good return value for this method and why?

def step(start_val, end_val, step_val)
  array = (start_val..end_val).to_a
  index = 0
  stepped_array = []
  while index < end_val
    stepped_array << array[index]
    index += step_val
  end
  stepped_array.each { |num| yield(num) }
end

p step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10
# [1, 4, 7, 10]

# The return value of my step method is an array of stepped values.

# LS:

def step(start_point, end_point, increment)
  current_value = start_point
  loop do
    yield(current_value)
    break if current_value + increment > end_point
    current_value += increment
  end
  current_value
end

p step(1, 10, 3) { |value| puts "value = #{value}" }

# value = 1
# value = 4
# value = 7
# value = 10
# 10

# current_value is yielded to the block and then incremented on each iteration.  We do not want
# to step beyond end_poing, so we exit the loop when current_value + increment > end_point. 
# Finally, we return current_value.  (sensible value is the reason) Range#step returns self
# (the original Range object) but that doesn't work for us. Another reasonable return value
# might be nil, or perhaps the last value returned by the block.

