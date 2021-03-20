require 'minitest/autorun'

require_relative 'text'


class TextTest < Minitest::Test
  def setup
    @file = File.open('sample.txt', 'r')
    @test_obj = Text.new(@file.read)
    @subbed_text = @test_obj.text.gsub('a', 'e')
  end

  def test_swap
    test_text = @test_obj.swap('a', 'e')
    assert_equal @subbed_text, test_text
  end

  def teardown
    @file.close
  end
end