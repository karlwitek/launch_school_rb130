# Adding methods to the TodoList class. #find_by_title, #all_done, #all_not_done, #mark_done,
# #mark_all_done, #mark_all_undone .

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

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end
  
  def select
    list = TodoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  # def find_by_title(string)
  #   each do |todo|
  #     return todo if todo.title == string
  #   end
  #   nil
  # end

  def find_by_title(title)# LS
    select { |todo| todo.title == title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  # def mark_done(string)
  #   find_by_title(string).done!
  # end

  def mark_done(title)# LS
    find_by_title(title) && find_by_title(title).done!
  end

  # def mark_all_done
  #   each do |todo|
  #     todo.done!
  #   end
  # end

  def mark_all_done# LS (same solution except for one-line block)
    each { |todo| todo.done! }
  end

  # def mark_all_undone
  #   each do |todo|
  #     todo.undone!
  #   end
  # end

  def mark_all_undone# LS (one-line block)
    each { |todo| todo.undone! }
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

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# # list.add(todo1)
# # list.add(todo2)
# # list.add(todo3)

# puts list
# list.add(todo1)
# # puts list.mark_done('Buy milk')
# results = list.select { |todo| todo.done? }
# puts list
# list.remove_at(0)
# puts list
# list.mark_done('Buy milk')
# puts list
# above testing my #mark_done vs. LS #mark_done. (LS prevents error)

# puts results.inspect
# puts results

# puts list.find_by_title('Buy milk')# [X] Buy milk (Todo#to_s is called. )
# should output be different? Just the title? Ok: problem states 'return the object'


# puts list.all_done
# ---- Today's Todos ----
# [X] Buy milk  ## output with puts list.all_done

# p list.all_done
#<TodoList:0x0000000005164770 @title="Today's Todos", @todos=[#<Todo:0x0000000005164b80 @title="Buy milk", @description="", @done=true>]>
# output with p list.all_done

# puts list.all_not_done
#---- Today's Todos ----
# [ ] Clean room
# [ ] Go to gym

# list.mark_done('Clean room')
# puts list
# ---- Today's Todos ----
# [X] Buy milk
# [X] Clean room
# [ ] Go to gym

# list.mark_all_done
# puts list
# ---- Today's Todos ----
# [X] Buy milk
# [X] Clean room
# [X] Go to gym

# list.mark_all_undone
# puts list
# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym
