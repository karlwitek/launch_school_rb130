class Sieve 

  attr_reader :array

  def initialize(last_number)
    @array = (2..last_number).to_h { |n| [n, 0] }.to_a
  end

  def find_next_index
    array.each_with_index do |sub, idx|
      return idx if sub.last == 0
    end
    nil
  end

  def mark_prime(index)
    array[index][1] = 1
  end

  def mark_composite(index)
    array[index][1] = 2
  end

  def mark_all_multiples(increment_value, index_at)
    index = index_at + increment_value
    while index <= array.size - 1
      mark_composite(index)
      index += increment_value
    end
  end

  def main
    index = 0
    while index != nil do 
      mark_prime(index)
      value_to_increment = array[index].first
      mark_all_multiples(value_to_increment, index)
      index = find_next_index
    end
  end

  def primes
    main
    array.select { |sub| sub.last == 1 }.map { |sub| sub.first }
  end
end
