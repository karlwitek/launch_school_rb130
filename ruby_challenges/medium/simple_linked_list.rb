class Element

  attr_accessor :data, :next

 def initialize(data, next_elem = nil)
  @data = data
  @next = next_elem
 end

 def datum
  @data
 end

 def tail?
  @next == nil
 end


end


class SimpleLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def push(value)
    prev_head = head
    @head = Element.new(value, prev_head)
  end

  def reverse
    new_list = SimpleLinkedList.new
    current_elem = head
    while current_elem.instance_of?(Element)
      new_elem = Element.new(current_elem.datum)
      new_list.push(new_elem.datum)
      current_elem = current_elem.next
    end
    new_list
  end

  def peek
    return nil if empty?
    head.datum
  end

  def empty?
    !head.instance_of?(Element)
  end

  def size
    size = 0
    current_elem = head
    while current_elem.instance_of?(Element)
      size += 1
      current_elem = current_elem.next
    end
    size
  end

  def pop
    current_head = head
    self.head = current_head.next
    current_head.datum
  end

  def to_a
    result = []
    current_elem = head
    while current_elem.instance_of?(Element)
      result << current_elem.datum
      current_elem = current_elem.next
    end
    result
  end

  def self.from_a(array = [])
    new_list = SimpleLinkedList.new
    if !array.nil?
      array.reverse_each do |val|
        new_list.push(val)
      end
    end
    new_list
  end
end
