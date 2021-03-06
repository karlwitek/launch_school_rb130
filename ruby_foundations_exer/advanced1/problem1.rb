# def factorial(n)
#   return nil if n < 0
#   return 1 if n == 0
#   result = 1
#   while n > 0
#     result *= n
#     n -= 1
#   end
#   result
# end

# puts factorial(4) # not used

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do 
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

# External iterators:

6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "======================================"

6.times { |number| puts "#{number}! == #{factorial.next}" }

puts "======================================="
factorial.rewind

6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "======================================="

# Internal iterators:

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end

