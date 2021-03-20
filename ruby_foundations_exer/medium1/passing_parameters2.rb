# Assigning an entire array to a single variable:

# birds = %w(raven finch hawk eagle)
# p birds # => ['raven','finch','hawk','eagle']

# Assigning every element to a separate variable:

# raven, finch, hawk, eagle = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p hawk # => 'hawk'
# p eagle # => 'eagle'

# Organize our array contents into groups, variables represent category names:
# Can use the splat operator: 

# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']

# Writea a method that takes an array as an argument. The method should yield the contents of the
# array to a block, which should assign your block variables in such a way that it ignores the 
# first two elements, and groups the remaining elements as a raptors array.

def group(first, second, *raptors)
  raptors = yield(first, second, *raptors)
  p raptors
end

group('finch', 'starling', 'hawk', 'eagle', 'bald eagle') { |bird1, bird2, *raptors| raptors }
# ["hawk", "eagle", "bald eagle"]

# LS:

birds = ['crow', 'finch', 'hawk', 'eagle']

def types(birds)
  yield birds
end

types(birds) do |_, _, *raptors|
  puts "Raptors: #{raptors.join(', ')}."
end
# Raptors: hawk, eagle.
# Start with an array named birds.  4 birds, two are raptors. Use the block variables to organize it 
# further. When we yield birds to the block, Ruby assigns the individual elements of birds to the
# different block variables.  It assigns the first two birds to _. The underscore tells Ruby that
# we aren't interested in those values.  The splat operator on the name block variable tells 
# Ruby to treat it as an Array and assign all remaining arguments to it.  Here, we group the last
# two elements from birds into the array, raptors.  Join and output them.


