require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist_methods'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  # def test_shift
  #   assert_equal(@todo1, @list.shift)
  #   assert_equal([@todo2, @todo3], @list.to_a)
  # end 

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
# using @list.to_a to compare two arrays. Need our own == method in TodoList to compare the objects

  def test_pop
    popped_todo = @list.pop
    assert_equal(@todo3, popped_todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    @list.mark_all_done
    assert_equal(true, @list.done?)# good. use false as expected value w/out #mark_all_done
  end

  # def test_raise_type_error
  #   assert_raises(TypeError) do 
  #     @list.add('string')
  #   end
  # end  # works.  LS below:

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi') }
  end

  # def test_shovel_operator
  #   new_todo = Todo.new('Pay bills')
  #   @list << new_todo
  #   assert_equal([@todo1, @todo2, @todo3, new_todo], @list.to_a)
  # end # works. LS below

  def test_shovel 
    new_todo = Todo.new('Walk the dog')
    @list << new_todo# TodoList object
    @todos << new_todo # array of Todo objects

    assert_equal(@todos, @list.to_a)
  end

  def test_add
    new_todo = Todo.new('Pay bills')
    @list.add(new_todo)
    @todos << new_todo# cannot use #add on an array, is an instance method of TodoList objects

    assert_equal(@todos, @list.to_a)
  end

  # def test_item_at
  #   item = @list.item_at(0)
  #   item2 = @list.item_at(8)
  #   assert_equal(@todo1, item)# this line works
  #   assert_equal(IndexError, item2)# this line is incorrect
  # end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  # def test_mark_done_at
  #   assert_raises(IndexError) { @list.mark_done_at(100) }
  #   assert_equal(true, @list.mark_done_at(0))# works , see different implementation
  # end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @list.mark_all_done
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  # def test_done!
  #   @list.done!
  #   arr = @todos.each { |todo| todo.done!}
  #   assert_equal(arr, @list.to_a)# Need #to_a so comparison is not done against TodoList object
  # end

  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)# this #done? is an instance method of Todo.
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)# done? is an instance method of TodoList. 
  end

  # def test_remove_at
  #   assert_raises(IndexError) { @list.remove_at(100) }
  #   item = @list.remove_at(0)
  #   assert_equal(@todo1, item)
  #   assert_equal([@todo2, @todo3], @list.to_a)
  # end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)# passes test
  end

  # def test_to_s_with_one_done
  #   output = <<-OUTPUT.chomp.gsub /^\s+/, ""
  #   ---- Today's Todos ----
  #   [X] Buy milk
  #   [ ] Clean room
  #   [ ] Go to gym
  #   OUTPUT

  #   @list.mark_done_at(0)
  #   assert_equal(output, @list.to_s)
  # end

  def test_to_s_2# same except for method name and mark_done_at(1), not 0
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
  
    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.mark_all_done# LS: @list.done! (Better, checks index)
    assert_equal(output, @list.to_s)
  end

  # def test_each
  #   arr1 = []
  #   arr2 = []
  #   @todos.each { |todo| arr1 << todo }
  #   @list.each { |todo| arr2 << todo }
  #   assert_equal(arr1, arr2)
  # end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  # def test_each_2
  #   obj = @list.each { |todo| todo }
  #   assert_equal([@todo1, @todo2, @todo3], obj.to_a)# Need #to_a !!
  # end

  def test_each_returns_original_list
    assert_equal(@list, @list.each { |todo| nil })
  end 
  # We don't actually want to perform any action when we iterate, so we have a nil as a placeholder.

  # def test_select
  #   new_list = TodoList.new("Today's Todos")
  #   new_list.add(@todo1)
  #   selected_list = @list.select { |todo| todo.title == 'Buy milk' }
  #   assert_equal(new_list.to_a, selected_list.to_a)
  # end
  # Need #to_a because there is no #== method defined for our TodoList class.  We need to compare the @todos array
  # of each object

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select { |todo| todo.done? }.to_s)
  end

  # added tests (using simplecov)

  def test_all_done# #all_done returns an new TodoList object (meets criteria)
    @todo1.done!
    new_obj = @list.all_done
    assert_equal([@todo1], new_obj.to_a)
  end

  def test_all_not_done
    @todo1.done!
    new_obj = @list.all_not_done
    assert_equal([@todo2, @todo3], new_obj.to_a)
  end

  def test_find_by_title
    new_obj = @list.find_by_title('Buy milk')
    assert_equal(@todo1, new_obj)# #find_by_title calls #first which returns a 
    # Todo object.  assert_equal is comparing the Todo object (new_obj in this case
    # is a Todo object with @todo1) Todo class has a #== method !!!
  end

  def test_mark_done
    @list.mark_done('Clean room')# 2nd todo in list of @todos
    assert_equal([@todo2], @list.all_done.to_a)
  end

  def test_mark_all_undone 
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_all_undone
    assert_equal([@todo1, @todo2, @todo3], @list.all_not_done.to_a)
    # #select returns a new TodoList object and is called in #all_not_done with !todo.done?
  end
end