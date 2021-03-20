class CustomSet

  attr_reader :set

  def initialize(array = [])
    @set = array.uniq
  end

  def to_s
    @set
  end

  def empty?
    set.empty?
  end

  def contains?(elem)
    set.include?(elem)
  end

  def subset?(other_obj)
    set.all? { |el| other_obj.set.include?(el) }
  end

end

c = CustomSet.new([1, 2, 3])
puts c.subset?(CustomSet.new([1, 2, 3, 4]))

