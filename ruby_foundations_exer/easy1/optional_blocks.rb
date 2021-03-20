# Write a method that takes an optional block, If the block is specified, the method should execute it,
# and return the value returned by the block. If no block is specified, the method should simply return
# the String 'Does not compute'
# examples:

# compute { 5 + 3 } == 8
# compute { 'a' + 'b' } == 'ab'
# compute == 'Does not compute.'

def compute
  if block_given?
    yield
  else
    'Does not compute.'
  end
end


# puts compute { 5 + 3 } == 8
# puts compute { 'a' + 'b' } == 'ab'
# puts compute == 'Does not compute.'

# true
# true
# true

# LS :

def compute
  return 'Does not compute.' unless block_given?
  yield
end

# The Kernel#block_given? method can be used to determine if a block has been passed to a method,
# even if there is no mention of a block in the method arguments.  Used here to detect when we 
# should return 'Does not compute.' , and when should return the value yielded by the block.

# FE: Modify the compute method so it takes a single argument and yields that argument to the block.
# Provide at least 3 examples of calling this new version of compute, including a no-block call.

def compute(string)
  return 'Does not compute.' unless block_given?
  yield(string)
end

puts compute('hello') { |str| str * 2 }# hellohello
# (me) the block needs to have a block parameter to accept the argument being passed to it
# with the yield(string)

puts compute('some string') { |str| str.upcase }# SOME STRING

puts compute('no block here')# Does not compute.



