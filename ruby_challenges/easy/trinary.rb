# Write a program that will convert a trinary number, represented as a string('102012'), to its
# decimal equivalent using first principles(without using an existing method or library that can
# work with numeral systems)
# Trinary numbers can contain 3 symbols ( 0, 1, 2). Invalid trinary entries should convert to
# decimal 0.

class Trinary
  def initialize(tri_string)
    @tri = tri_string
  end

  def valid_array
    tri_array = @tri.split('')
    int_array = tri_array.map(&:to_i)
    arr = tri_array.any? { |el| el.match(/\D/)} ? [0] : int_array
    arr = arr.any? { |num| num > 2 } ? [0] : arr
    arr
  end

  def to_decimal
    decimal = 0
    arr = valid_array

    0.upto(arr.size - 1) do |exp|
      decimal += arr.pop * (3 ** exp)
    end
    decimal
  end
end

# student solution:

class Trinary
  def initialize(str)
    @trinary = str
  end

  def to_decimal
    return 0 if invalid_trinary?
    numbers = @trinary.reverse.chars.map(&:to_i)
    numbers.each_with_index.map { |num, idx| 3**idx * num }.inject(:+)
  end

  private

  def invalid_trinary?
    @trinary.match(/[^0-2]/)
  end
end
