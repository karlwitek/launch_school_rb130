# Write a method that returns a list of all of the divisors of the positive integer passed in as an 
# argument. The return value can be in any sequence you wish.
# examples:

# divisors(1) == [1]
# divisors(7) == [1, 7]
# divisors(12) == [1, 2, 3, 4, 6, 12]
# divisors(98) == [1, 2, 7, 14, 49, 98]
# divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

def divisors(int)
  result = []
  range = (1..(int / 2.0).ceil)
  range.each do |i|
    result << i if int % i == 0
  end
  result << int
  result.uniq
end

# p divisors(64)

# puts divisors(1) == [1]
# puts divisors(7) == [1, 7]
# puts divisors(12) == [1, 2, 3, 4, 6, 12]
# puts divisors(98) == [1, 2, 7, 14, 49, 98]
# puts divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
# # (all true)
# LS:

# def divisors(number)
#   1.upto(number).select do |candidate|
#     number % candidate == 0
#   end
# end

# LS: solution is straightforward; it simply iterates through all of the candidate divisors, and 
# creates a list of the actual divisors.  

# FE: Brute force algorithm (not doing anything to optimize the algorithm, trying every possible
# solution. Not necessarily bad, but the speed of brute force algorithms should always be examined.
# How fast can you make your solution go? How big of a number can you quickly reduce to its divisors?
# can you make divisors(999962000357) return almost instantly?
# The divisors are [1, 999979, 999983, 999962000357] Hint: half of the divisors gives you the other half.


def divisors(number)
  num = Integer.sqrt(number)
  arr = 1.upto(num).select do |candidate|
    number % candidate == 0
  end
  arr
  arr2 = arr.clone
  arr.reverse_each do |n|
    arr2 << number / n
  end
  arr2.uniq
end

# p divisors(64)

# puts divisors(1) == [1]
# puts divisors(7) == [1, 7]
# puts divisors(12) == [1, 2, 3, 4, 6, 12]
# puts divisors(98) == [1, 2, 7, 14, 49, 98]
# puts divisors(99400891) == [1, 9967, 9973, 99400891]

p divisors(999962000357)# [1, 999979, 999983, 999962000357]

