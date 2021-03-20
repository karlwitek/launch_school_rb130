class Diamond

  @@array = ('A'..'Z').to_a

  def self.make_diamond(letter)
    if letter == 'A' || letter == 'B'
      helper_method(letter)
    else
      index = @@array.index(letter)
      s = ' '
      num_iter = (index * 2) + 1
      num_space_between = num_iter - 2
      num_lead_space = index
      between = 1
      puts "#{s * num_lead_space}A"

      (index).times do |arr_idx|# top half
        num_lead_space -= 1
        puts "#{s * num_lead_space}#{@@array[arr_idx + 1]}#{s * between}#{@@array[arr_idx + 1]}"
        between += 2
      end
      num_lead_space +=1
      between = num_space_between
      (index - 1).downto(1) do |arr_idx|
        between -=2
        puts "#{s * num_lead_space}#{@@array[arr_idx]}#{s * between}#{@@array[arr_idx]}"
        num_lead_space += 1

      end
      puts "#{s * num_lead_space}A"

    end
  end

  def self.helper_method(letter)
    if letter == 'A'
      puts 'A'
    else
      output = <<~OUTPUT
       A 
      B B
       A 
      OUTPUT
      puts output
    end
  end
end

Diamond.make_diamond('C')

Diamond.make_diamond('F')