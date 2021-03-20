class Text
  attr_reader :text
  
  def initialize(text)
    @text = text#.read# saves actual text file (not the object in @text)
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end

  def output
    @text#.read (don't need .read now , saved the text in #initialize)
  end
end

# file = File.open('sample.txt', 'r')
# file.close# Error 'closed stream (IO Error)' closing file before instantiating object.

# text_obj = Text.new(file)

# puts text_obj.output# #<File:0x0000000005083360> ( without .read (@text.read))
# now outputs the file (with @text.read)
#file.close # ?? did this close the file? (Yes based on file.close above)

# text_obj.swap('a', 'e')
# puts text_obj.output
# did not change text with #gsub, changed code to #gsub!. then ouputted the changes.
# Instead: puts text_obj.swap('a', 'e') : outputs correctly.  changed back to gsub (no !)


# puts text_obj.swap('a', 'e')
# file.close


# file = File.open('sample.txt', 'r')
# text_obj = Text.new(file.read)

# puts text_obj.word_count
# file.close
