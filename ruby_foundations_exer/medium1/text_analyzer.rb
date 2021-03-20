# class TextAnalyzer 
#   def process
#     file_arr = File.readlines('sample.txt')
#     text = file_arr.join
#     yield(text)
#   end
# end

# lines = TextAnalyzer.new
# lines.process { |text| puts "#{text.split.length} words"}
# lines.process { |text| puts "#{text.split(/\n/).length} lines"}
# lines.process { |text| puts "#{text.split(/\n{2}/).length} paragraphs"}

# 126 words
# 15 lines
# 3 paragraphs

# LS:

class TextAnalyzer
  def process
    file = File.open('sample.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(" ").count} words" }

# 3 paragraphs
# 15 lines
# 126 words

# Remember to always close files when you finish using them.
# Pass the context of the file to the block, we must load the file's contect and call the block, 
# which we do with yield(file.read)
# 'sandwich code' does some pre and post processing for some arbitrary action.  Here, the pre_processing
# opens a file, and the post-processing closes it.  Together, they sandwich the action that loads the 
# file's contents and passes it to a block. Since we're passing text to the blocks, the blocks should 
# capture that text: { |text| puts ... }  Each block contains a puts statement, so we must provide arguments
# to puts that perform the necessary procesing and format the answer accordingly. The last step fills
# in these details with String#split and Array#count (see solution)

