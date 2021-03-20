# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '
  
  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done 
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
    description == otherTodo.description &&
    done == otherTodo.done 
  end
end

# todo1 = Todo.new('Buy milk')
# todo2 = Todo.new('Clean room')
# todo3 = Todo.new ('Go to gym')

# puts todo1
# puts todo2
# puts todo3
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# todo1.done!
# puts todo1
# puts todo2
# puts todo3
# [X] Buy milk
# [ ] Clean room
# [ ] Go to gym

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end
  
  def add(obj)
    if obj.is_a? Todo
      @todos << obj
    else
      raise TypeError, 'Can only add Todo objects'
    end
    @todos
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    result = []
    @todos.each { |item| result << item.title }
    result
  end

  def done?
    @todos.all? { |item| item.done == true }
  end

  def item_at(index)
    @todos.fetch(index)
    @todos[index].title
  end

  def mark_done_at(index)
    @todos.fetch(index)
    @todos[index].done = true
  end

  def mark_undone_at(index)
    @todos.fetch(index)
    @todos[index].done = false
  end

  def done!
    @todos.each { |item| item.done = true }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.fetch(index)
    @todos.slice!(index)
  end

  def to_s
    puts "---- #{title} ----"
    @todos.each do |item|
      "#{item}"
    end
  end
end




todo1 = Todo.new('Buy milk')
todo2 = Todo.new('Clean room')
todo3 = Todo.new ('Go to gym')
list = TodoList.new("Today's Todos")

list.add(todo1)
list.add(todo2)
list.add(todo3)
list.done!
puts list.to_s