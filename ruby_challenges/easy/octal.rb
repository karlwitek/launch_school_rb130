# Implement a decimal conversion. Given an octal string, produce a decimal output;
# Write code for the conversion.
# Treat invalid input as octal 0.

class Octal

  def initialize(octal_as_string)
    @octal = octal_as_string
  end

  def valid_array
    arr = @octal.split('')
    arr_ints = arr.map(&:to_i)
    arr = arr.any? { |el| el.match(/\D/) } ? [0] : arr_ints 
    arr = arr.any? { |el| el > 7 } ? [0] : arr
    arr
  end

  def to_decimal
    decimal = 0
    arr = valid_array
    (arr.size - 1).downto(0) do |exp|
      decimal += (arr.shift * (8 ** exp))
    end
    decimal
  end
end
