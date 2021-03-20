class Diamond

  def self.make_diamond(letter)
    @@letter_array = ('A'...letter).to_a + ('A'..letter).to_a.reverse

    result_arr = []
    @@letter_array.each do |let|
      result_arr << make_row(let).center(width_of_diamond(letter))
    end
    result_arr.join("\n") + "\n"
  end

  def self.make_row(letter)
    return 'A' if letter == 'A'
    return 'B B' if letter == 'B'
    letter + number_of_spaces_between(letter) + letter
  end

  def self.number_of_spaces_between(letter)
    return "" if letter == 'A'
    return " " if letter == 'B'
    spaces = 1
    arr = ['B']
    str = 'B'

    until arr.last == letter
      str = str.succ
      arr << str
      spaces += 2
    end
    " " * spaces
  end

  def self.width_of_diamond(letter)
    return 1 if letter == 'A'
    number_of_spaces_between(letter).size + 2
  end
end
