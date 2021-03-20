class Diamond 

  @@array = ('A'..'Z').to_a

  def self.make_diamond(letter)
    @@index = @@array.index(letter)
    if letter == 'A'
      puts 'A'
    else
      puts "#{' ' * @@index}A"
      top_half
      bottom_half
      puts "#{' ' * @@index}A"
    end
  end

  def self.top_half
    lead_space = @@index - 1
    inner_space = 1
    @@index.times do |arr_idx|
      puts "#{' ' * lead_space}#{@@array[arr_idx + 1]}#{' ' * inner_space}#{@@array[arr_idx + 1]}"
      inner_space += 2
      lead_space -= 1
    end
  end

  def self.bottom_half
    lead_space = 1
    inner_space = (@@index * 2 + 1) - 4
    (@@index - 1).downto(1) do |arr_idx|
      puts "#{' ' * lead_space}#{@@array[arr_idx]}#{' ' * inner_space}#{@@array[arr_idx]}"
      lead_space += 1
      inner_space -= 2
    end
  end
end
