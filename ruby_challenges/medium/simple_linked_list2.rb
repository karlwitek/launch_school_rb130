class Element

  attr_reader :datum, :next_obj

  def initialize(value, next_obj = nil)
    @datum = value
    @next_obj = next_obj
  end

  def tail?
    !!(next_obj == nil)
  end

  def next
    next_obj
  end

  def next=(obj)
    @next_obj = obj
  end

  def to_s 
    datum
  end
end


class SimpleLinkedList

  attr_reader :head

  def initialize
      @head = nil
  end

  def self.from_a(array)
    list = SimpleLinkedList.new
    if array
      array.reverse_each { |el| list.push(el) }
    end
    list
  end

  def push(value)
    current_head = head
    @head = Element.new(value)
    head.next = current_head

    # prev_head = head  (better implementation)
    # @head = Element.new(value, prev_head)
  end

  def empty?
    head == nil
    # !head.instance_of?(Element)
  end

  def pop 
    current_head = head
    @head = head.next_obj
    current_head.datum
  end

  def peek
    return nil if empty?
    head.datum
  end

  def size
    size = 0
    current_head = head
    until current_head == nil
      current_head = current_head.next
      size += 1
    end
    size
  end

  def to_a 
    result = []
    current_head = head
    until current_head == nil
      result << current_head.datum
      current_head = current_head.next
    end
    result
  end

  def reverse
    new_list = SimpleLinkedList.new
    current_head = head
    until current_head == nil
      new_list.push(current_head.datum)
      current_head = current_head.next
    end
    new_list
  end
end
