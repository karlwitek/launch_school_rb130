# Write a program that, given a word and a list of possible anagrams, selects the correct sublist
# that contains the anagrams of the word.


class Anagram 
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(array)
    result = []
    sorted_word = word.downcase.split('').sort.join
    array.each do |elem|
      next if elem.downcase == word.downcase
      poss_anagram = elem.downcase.split('').sort.join
      result << elem if poss_anagram == sorted_word
    end
    result
  end
end
