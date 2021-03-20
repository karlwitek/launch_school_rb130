require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('./sample.txt', 'r')
  end

  def test_word_count
    text = Text.new(@file.read)
    expected_count = text.text.split.count
    actual_count = text.word_count

    assert_equal expected_count, actual_count
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end

  # LS:
  # def setup
  #   @file = File.open('./sample_text.txt', 'r')
  # end

  # # omitted for brevity

  # def test_word_count
  #   text = Text.new(@file.read)
  #   assert_equal 72, text.word_count
  # end

  # def teardown
  #   @file.close
  # end

end

# 