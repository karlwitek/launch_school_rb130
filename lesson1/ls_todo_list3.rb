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

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def each
    @todos.each do |todo|# can call Array#each because @todos is an array.
      yield(todo)
    end
    self# this line returns the object(instance), behaves like Array#each.
         # where the array is the object, here the TodoList obj is the object
  end

  # def select
  #   result = []
  #   @todos.each do |todo|
  #     result << todo if yield(todo)
  #   end
  #   result
  # end# worked, but still using Array#each. Should use Todo#each. Also, this returns a new
  # array.  In order to follow the pattern of Ruby's core library, #select should return a new
  # object. (a new version of the object that calls #select). In our method, a TodoList object
  # is calling #select. ('Return an object of the calling class) See #select below:


  # LS method: returns a new TodoList object(list) in addition to using our #each method
  def select
    list = TodoList.new(title)# title is getter method?
    each do |todo|
      list.add(todo) if yield(todo)# calls #add which appends todo object to @todos(inst var for list)
    end
    list# returning a new object, not an array
  end
  # #each is iterating over @todos(array and instance var) of the object! The object is the original
  # TodoList object (also named 'list'). Iterating over @todos of original object and appending Todo
  # objects to the new TodoList object. (local var , named 'list' also)
  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo
    
    @todos << todo
  end
  alias_method :add, :<<

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos.clone
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results.inspect
# [#<Todo:0x00000000050f1748 @title="Buy milk", @description="", @done=true>]

# Next: Refine our #select method so it returns a TodoList object instead of an Array object.
# #<TodoList:0x00000000051acef8 @title="", @todos=[#<Todo:0x00000000051ad128 @title="Buy milk", @description="", @done=true>]>

puts results# [X] Buy milk

# output after using LS #select method:

#<TodoList:0x000000000522d030 @title="Today's Todos", @todos=[#<Todo:0x000000000522d210 @title="Buy milk", @description="", @done=true>]>
# above is from puts results.inspect

# ---- Today's Todos ----
# [X] Buy milk

