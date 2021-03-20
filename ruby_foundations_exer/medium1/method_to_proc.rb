# Fill in the missing part of the code so we can convert an array of integers to base8(octal numbers)
# Use the comments for help in determining where to make your modifications.


def convert_to_base_8(n)
  #n.method_name.method_name # replace these two method calls
  n.to_s(8).to_i
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
new_arr = [8, 10, 12, 14, 16, 33].map(&base8_proc)

# The expected return value of #map on this number array should be:

# [10, 12, 14, 16, 20, 41]

p new_arr# [10, 12, 14, 16, 20, 41]

# LS:

# In our convert_to_base_8 method, the method takes a number-like argument, n.  We also see that 
# to_s(n) is using a number-like argument as well.  Start here. We find that this form of to_s
# converts integers into the String representation of a base-n number.

# Right now, we are using decimals(base 10), so to convert a number n, to base 8, we call to_s(8)
# on it.  If we use 8 as an example, 8.to_s(8) returns "10".  We want an integer, not a string, so
# we call #to_i on the return value of n.to_s(8).

# base8_proc = method(argument).to_proc . (Next missing piece of code)

# We researched 'method' from class Object.  ( 'method' is a method of class Object)
# Looking at Documentation, we see that a symbol of an existing method may be passed into method
# method(sym).  If we do that, the functionality of that method (passed in sym (which is the name
# of the method)) gets wrapped in a Method object, and we may now do work on that object.

# We want to convert our array of numbers to base 8, so it makes sense to make a method object out
# of the convert_to_base_8 method. This leaves us with:

# base8_proc = method(:convert_to_base_8).to_proc     The final piece of this exercise asks us to
# fill in this line : [8,10,12,14,16,33].map(&a_proc).  We want access to the functionality of 
# method convert_to_base_8 , and we know that it has been converted to a Proc object, so that Proc
# is the natural choice.  Remember that using just & ( and not &:) lets us turn a Proc object to 
# a block.  A block that can now be used with #map.

# How a method looks when converted to a Proc.  You can imagine the conversion to look like:

# def convert_to_base_8(n)
#   n.to_s(8).to_i
# end

# ->

# Proc.new { |n| n.to_s(8).to_i }
#when we use & to convert our Proc to a block, it expands out to...

# ->
# [8, 10, 12, 14, 16, 33].map { |n| n.to_s(8).to_i }

