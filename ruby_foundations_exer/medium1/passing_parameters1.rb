# Modify the method so that the display/output of items is moved to a block
# and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

# def gather(items)
#   puts "Let's start gathering food."
#   puts "#{items.join(', ')}"
#   puts "Nice selection of food we have gathered!"
# end


# def gather(items)
#   puts "Let's start gathering food."
#   puts yield(items)
#   puts "Nice selection of food we have gathered!"
# end

# gather(items) { "#{items.join(' - ')}" }

# good, LS:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) { |produce| puts produce.join('; ') }

# To accomplish our task, we need to yield the items array to a block. Moving the implementation of
# our items formatting to a block gives the user more flexibility and choice for how they wish to use
# gather.  By yielding items to a block, the user can join those items for presentation purposes or
# they can choose a completely different representation:

gather(items) do |produce|
  puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
end

# Let's start gathering food.
# We've gathered some vegetables: corn and cabbage
# Nice selection of food we have gathered!


