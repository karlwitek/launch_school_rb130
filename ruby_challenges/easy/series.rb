# Write a program that will take a string of digits and give you all the possible consecutive
# number series of length n in that string.
# ex:  '01234' 
# - 012
# - 123
# - 234 (test's expected value is a nested array, one array for each number series)
# sample test method:

# def test_simple_slices_of_one
#   series = Series.new('01234')
#   assert_equal [[0], [1], [2], [3], [4]], series.slices(1)
# end


# create a class (Series) with an instance method 'slices'
# #slices takes one parameter, (the number of consecutive digits to slice, 'length')
# the object has an instance variable that is assigned to a string of numbers.
# Most tests are 'skipped' 

class Series
  attr_reader :str_num 

  def initialize(stringed_number)
    @str_num = stringed_number
  end

  def slices(length)
    raise(ArgumentError) if length > str_num.size
    result = []
    start_idx = 0
    end_idx = length - 1

    while end_idx <= str_num.size - 1 do
      sub_str = str_num[start_idx..end_idx]
      sub_arr = sub_str.split('').map(&:to_i)
      result << sub_arr
      start_idx += 1
      end_idx += 1
    end
    result    
  end
end
