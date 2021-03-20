# Write a program that given a phrase can count the occurences of each word in that phrase.

class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def clean_up_phrase
    # remove punctuation (except apostrophes, numbers)
    # normalize case here? tests: hash includes all lowercase words
    # arr = phrase.split(%r{,\s*})
    # arr = phrase.split(/[,]/).join.split(' ')
    arr = phrase.split(',')
    p arr
    arr = arr.map { |e| e.split(' ') }.flatten
    p arr
    b = arr.map { |word| word.gsub(/[^0-9a-zA-Z']/, '')}.map { |word| word.downcase }
    b.select { |el| el != '' }
    
  end

  def word_count
    hash = Hash.new(0)
    arr = clean_up_phrase
    arr.each do |word|
      num = arr.count(word)
      hash[word] = num unless hash.has_key?(word)
    end
    hash
  end
end


# phrase = Phrase.new('testing, 1, 2 testing')

#phrase = Phrase.new('testing,1,2 testing')

# p phrase.word_count

# counts = { 'testing' => 2, '1' => 1, '2' => 1 }

#phrase = Phrase.new('one,two,three')
phrase = Phrase.new("Joe can't tell between 'large' and large.")
p phrase.word_count

# counts = { 'one' => 1, 'two' => 1, 'three' => 1 }