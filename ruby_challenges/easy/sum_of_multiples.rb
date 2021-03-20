# Write a program that can find the sum of the multiples of a given set of numbers.  If no set of 
# numbers is given, default to 3 and 5.

class SumOfMultiples
  attr_reader :set
  @@set = [3, 5]

  def initialize(*set)
    @set = set
  end

  def find_multiples
    @multiples = set.empty? ? @@set : set
  end

  def self.to(number)
    range = (1..number - 1)
    result = [0]
    @@set.each do |multiple|
      range.each do |num|
        result << num if num % multiple == 0
      end
    end
    result.uniq.reduce(&:+)
  end

  def to(number)
    find_multiples
    result = [0]
    range = (1..number - 1)
    @multiples.each do |multiple|
      range.each do |num|
        result << num if num % multiple == 0
      end
    end
    result.uniq.reduce(&:+)
  end
end
