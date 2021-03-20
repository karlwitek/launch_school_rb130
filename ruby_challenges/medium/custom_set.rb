class CustomSet

  attr_reader :custom_set
  
  def initialize(array = [])
    @custom_set = array.uniq
  end

  def union(other_obj)
    combined = (custom_set + other_obj.custom_set).uniq
    CustomSet.new(combined)
  end

  def difference(other_obj)
    different_elems = custom_set - other_obj.custom_set
    CustomSet.new(different_elems)
  end

  def intersection(other_obj)
    common = custom_set.select { |el| other_obj.custom_set.include?(el)}
    CustomSet.new(common)
  end

  def add(element)
    custom_set << element
    @custom_set = custom_set.uniq
    self
  end

  def ==(other_obj)
    custom_set.sort == other_obj.custom_set.sort
  end

  def eql?(other_obj)
    self == other_obj
  end

  def disjoint?(other_obj)
    custom_set.none? { |el| other_obj.custom_set.include?(el) }
  end

  def subset?(other_obj)
    return true if custom_set.empty?
    custom_set.all? { |el| other_obj.custom_set.include?(el) }
  end

  def contains?(element)
    custom_set.include?(element)
  end

  def empty?
    custom_set.size == 0
  end
end
