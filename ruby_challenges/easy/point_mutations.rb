# Write a program that can calculate the Hamming distance between two DNA strands. (the # of differences
# between the two strands)
# If one strand is shorter, compare against the longer strand the length of the shorter strand.

class DNA 
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    length = strand.length >= other_strand.length ? other_strand.length : strand.length
    num_of_mutations = 0
    length.times do |idx|
      next if strand[idx] == other_strand[idx]
      num_of_mutations += 1
    end
    num_of_mutations
  end
end
