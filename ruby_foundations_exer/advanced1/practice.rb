# Enumerator: Ruby's Versatile Iterator (blog.carbonfive.com/enumerator-rubys-versatile-iterator/)
# An external iterator is controlled by the client, while an internal iterator is controlled by the aggregate object.
# In Ruby , internal iteration is the norm. Ruby's Enumerable module add several traversal, searching, and sorting
# algorithms to the main collection classes, Array, Hash. 
# Enumerator is an Enumerable plus external iteration. 
# Creating an Enumerator from a Block:

# enum = Enumerator.new do |yielder|
#   yielder << 'a'
#   yielder << 'b'
#   yielder << 'c'
# end

# puts enum.next
# puts enum.next
# puts enum.next
# a
# b
# c

# puts enum.next# practice.rb:17:in `next': iteration reached an end (StopIteration)
# StopIteration is rescue by Kernel#loop

# enum = Enumerator.new do |yielder|
#   yielder << 1
#   yielder << 2
# end

# loop do
#   puts enum.next
# end

# puts 'this will be printed out'
# 1
# 2
# this will be printed out

# Creating an Enumerator from an Enumerable:

# The more common way to create an Enumerator is from an Enumerable object, specifically an object that defines an #each
# method.   Object#to_enum (aliased to Object#enum_for) is implemented to return a new Enumerator that will enumerate by
# sending #each to its receiver.

# array = [1, 2, 3]
# enum = array.to_enum
# puts enum.each { |n| n * 2 }
# 1
# 2
# 3
#  #each returns the caller (me)
#enum.each { |n| puts n * 2 }
# 2
# 4
# 6
# this example is iterating over the array? 
# Enumerator itself is Enumerable, so we can use the full power of Enumerable.

# Object#to_enum takes a method name to generate the Enumerator. The default is #each. Passing in an alternative method
# can result in some strange behavior.

# array = [1, 2, 3]
# enum = array.to_enum :map
# p enum.each { |n| n * 2 } # [2, 4, 6] (returns a new array, #each acts like #map)

# p enum.with_index { |n, index| [index, n ** 2] }# [[0, 1], [1, 4], [2, 9]]
# In this example, we created an Enumerator based on Array#map. This causes Enumerator#each to act like #map.
# Enumerator#with_index was then used to create a #map_with_index method.

# Creating an Enumerator from a Blockless Enumerable Method Call:
# Several Enumerable methods that take a block will return an Enumerator when called without a block. For example,
# calling Array#select without a block will return an Enumerator with an #each method that will filter like #select.
# These blockless calls offer a concise alternative to Object#to_enum.

array = [1, 2, 3, 4]
enum = array.select
p enum.each { |n| n % 2 == 0 }# [2, 4] (return an array, behaves like #select)

hash = { one: 1, two: 2 }
enum = hash.map
p enum.each { |_, value| value * 10 }# [10, 20]

range = 1..10
enum = range.drop_while

p enum.each { |n| n < 7 }# [7, 8, 9, 10]

Struct.new 'Foo', :name, :age 
foo = Struct::Foo.new 'foo', 42
enum = foo.cycle
p enum.take 5# ["foo", 42, "foo", 42, "foo"]

# Not sure about 'Struct'

# Turning Non-Enumerables into Enumerables:

# So far, we've looked at how to construct Enumerators from scratch and from Enumerables. However, several non-Enumerable
# classes also return Enumerators. Since Enumerator is Enumerable, this allow you to effectively turn a non-Enumerable
# class into an Enumberable one:
# Integer, for example, returns an Enumerator from #times, #upto, and #downto:

enum = 5.times
p enum.map { [] }# [[], [], [], [], []]

enum = 1.upto 10
p enum.inject(:+)# 55

enum = 5.downto 0
p enum.map { |n| n * 2 }# [10, 8, 6, 4, 2, 0]

# String has several iteration methods that will return an Enumerator when not given a block:

enum = 'hello'.each_char
p enum.map &:upcase# ["H", "E", "L", "L", "O"]

enum = 'abc'.each_byte
p enum.map { |n| n }# [97, 98, 99]

enum = "one\ntwo\nthree".each_line
p enum.map { |line| line.chomp.reverse }# ["eno", "owt", "eerht"]

enum = 'a'.upto 'e'
p enum.grep /[aeiou]/# ["a", "e"]

enum = "one two three".gsub /\b\w+\b/
puts enum.next
puts enum.next
puts enum.next
# one
# two
# three

# Infinite Lists:

# An Enumerator's external iteration can be used to construct infinite lists:

enum = Enumerator.new do |yielder|
  n = 0
  loop do 
    yielder << n
    n += 1
  end
end

p enum.first 10# [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# Lazy Enumeration:

# One problem with infinite lists is that an internal iteration method, for example #select, will hang forever.
# This is because methods like #select and #map rely on filtering/transforming the entire collection, ie., they'll
# ask for the entire infinite list.

# enum.select { |n| n % 20 == 0 }.first 5 # NEVER RETURNS!! ( this enum is from above infinite example)

# Lazy versions of internal iteration methods provide a solution:

class Enumerator
  def lazy_select(&blk)
    self.class.new do |yielder|
      each do |n|
        yielder << n if blk[n]
      end
    end
  end
end

p enum.lazy_select { |n| n % 20 == 0 }.first 5# [0, 20, 40, 60, 80]

