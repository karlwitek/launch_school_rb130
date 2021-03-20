# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the corresponding output:

# gather(items) do | , |
#   puts
#   puts
# end

gather(items) do |first, *rest|
  puts "#{first}, #{rest[0..1].join(', ')}"
  puts "#{rest[-1]}"
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# output: (good)

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!




# gather(items) do | , , |
#   puts
#   puts
#   puts
# end

gather(items) do |first, second, *rest|
  puts "#{first}"
  puts "#{second}, #{rest[0]}"
  puts "#{rest[1]}"
end
# good

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!


# gather(items) do | , |
#   puts
#   puts
# end

gather(items) do |first, *rest|
  puts "#{first}"
  puts "#{rest.join(', ')}"
end

# good
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!


# gather(items) do | , , , |
#   puts
# end

gather(items) do |first, second, third, fourth|
  puts "#{first}, #{second}, #{third}, #{fourth}"
end

# good:

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

# LS:
# my solutions use the * operator as the last block variable.  Ruby doesn't require this.
# examples (LS)

# 1
gather(items) do |*produce, wheat|
  puts produce.join(', ')
  puts wheat
end

# 2
gather(items) do |apples, *vegetables, wheat|
  puts apples
  puts vegetables.join(', ')
  puts wheat
end
# see handwritten notes for this exercise
