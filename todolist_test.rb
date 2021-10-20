require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

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

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todos[0], @list.first)
  end

  def test_last
    assert_equal(@todos[-1], @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @todos[1..2])
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @todos[0..1])
  end

  def test_done
    assert_equal(false, @list.done?)
  end

  def incorrect_object_add_error
    assert_raises(TypeError) { @list << "string" }
    assert_raises(TypeError) { @list.add("string")}
    
  end

  def test_shovel
    @list << Todo.new("Test")
    assert_equal(4, @list.size)
  end

  def test_shovel_add_alias
    @list << Todo.new("Test")
    @list.add(Todo.new("Test"))
    assert_equal(5, @list.size)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(100) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end

  def test_mark_undone_at
    @list.mark_done_at(0)
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_raises(IndexError) { @list.mark_undone_at(100) }
  end

  def test_done!
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_equal(@todo1, @list.remove_at(0))
    assert_equal(2, @list.size)
    assert_raises(IndexError) { @list.remove_at(100) }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym

    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_done_item
    @list.first.done!

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [✓] Buy milk
    [ ] Clean room
    [ ] Go to gym

    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_with_all_items_done
    @list.done!

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [✓] Buy milk
    [✓] Clean room
    [✓] Go to gym

    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_each
    count = 0
    @list.each { count += 1}
    assert_equal(3, count)
  end

  def test_each_return
    assert_equal(@list, @list.each)
  end

  def test_select
    selected = @list.select { |todo_item| todo_item.title == "Buy milk"}
    assert_equal(1, selected.size)
    assert_instance_of(TodoList, selected)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
  end
end