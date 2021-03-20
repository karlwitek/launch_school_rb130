def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

#compare('hello') { |word| word.upcase }
# #compare returns nil (last expression is a puts). The 'after' local variable in assigned the return value
# of the block.  (this behavior is similar to methods; blocks have a return value determined by the last
# expression in the block). This implies that blocks can mutate the argument with a destructive method, or 
# the block can return a value. The return value of the #compare method is not related to what we're doing
# in the block.

#compare('hello') { |word| puts 'hi' }
# After: HELLO
# Before: hello
# hi
# After:

# The return value of the block is nil due to the puts method.  The string interpolation evaluates nil to an 
# empty string.

# Methods with an explicit block parameter:
# def test(&block)
#   puts "What's &block? #{block}"
# end

#test { sleep(1) }# What's &block? #<Proc:0x00000000050e6d98@./blocks_130.rb:28>
# the block local variable is now a Proc object.  We can name it whatever, as long as we define it with
# a leading &.

# Now, we have a variable that represents the block, so we can pass the block to another method:

def test2(block)
  puts 'hello'
  block.call
  puts 'goodbye'
end

def test(&block)
  puts '1'
  test2(block)
  puts '2'
end

# test {puts 'xyz' }
# 1
# hello
# xyz
# goodbye
# 2

# Only need to use & for the block parameter in #test. Since block is already a Proc object when we call
# test2, no conversion is needed.
# We use block.call inside test2 to invoke the Proc instead of yield.(would do the same if wanted to invoke
# the Proc from test)
# This is a simple example: More complicated if the caller passes in a Proc object, a lambda, or some other
# object to a method that takes an explicit block. For now, you just need to know that Ruby converts blocks 
# passed in as explicit blocks to a simple Proc object. (this is why we need to use #call to invoke the
# Proc object)

# Walk through: Build a 'times' method: write our own times method that mimics the behavior of the
# Integer#times method.
# 5.times do |num|
#   puts num
# end
# 0
# 1
# 2
# 3
# 4
# Notice the Integer#times method's first block argument is 0, and the last block argument is 1 less than the
# calling object. The method returns the calling object, 5.

# Our times method will exhibit the same behavior, yielding to the block starting with 0 and going up to 
# 1 less than the method argument.  We don't have a calling object, but we do have a method argument, so
# we'll return that. Should be able to write :
# times(5) do |num|
#   puts num
# end

# and get identical output.

def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number
end

# method invocation:
# times(5) do |num|
#   puts num
# end
# Pay attention to the interplay between the method implementation and the block.  From within the method,
# we are yielding execution to the block, and we are passing an argument to the block. When we call the method,
# we know that we must include a block that takes an argument.

# Build a 'each' method:
# [1, 2, 3].each { |num| puts num } # example of Array#each method

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array# this mimics the behavior of Array#each where the calling object is the return value of the method
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end
# 1
# 2
# 3
# 4
# 5

# Our #each method relies on the fact that our method does not implement what action to perform when iterating
# through the array.  It is solely focused on iterating and not on anything beyond that.  Writing a generic
# iterating method allows method callers to add additional implementation details at method invocation time by
# passing in a block. This is why when we implemented the method, we yield to the block.  We pass the current
# element we're working with to the block. At each iteration within the while loop, execution then goes to the
# block (with the current element as the block argument) and will return execution back to the while loop after
# executing the block. Then, the counter is incremented and the while loop continues and the next element is 
# yielded to the block.
