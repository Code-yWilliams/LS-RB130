# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = '✓'
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

  def initialize(title="Todo List")
    @title = title
    @todos = []
  end

  def add(todo_item)
    if todo_item.class == Todo
      @todos << todo_item
    else
      raise TypeError, "Can only add Todo objects"
    end
  end

  alias :<< :add

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[-1]
  end

  def done?
    @todos.all? { |todo_item| todo_item.done? }
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    @todos.fetch(index).done!
  end

  def mark_undone_at(index)
    @todos.fetch(index).undone!
  end

  def done!
    @todos.each { |todo_item| todo_item.done! }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    if @todos.fetch(index)
      @todos.delete_at(index)
    else
      raise IndexError
    end
  end

  def each
    counter = 0
    until counter == @todos.size 
      yield(@todos[counter])
      counter += 1
    end
    self
  end

  def select
    result = TodoList.new
    @todos.each do |todo_item|
      result << todo_item if yield(todo_item)
    end
    result
  end

  def find_by_title(string)
    select { |todo_item| todo_item.title == string }.first
  end

  def all_done
    select { |todo_item| todo_item.done? }
  end

  def all_not_done
    select { |todo_item| !todo_item.done? }
  end

  def mark_done(string)
    find_by_title(string).done!
  end

  def mark_undone(string)
    find_by_title(string).undone!
  end

  def mark_all_done
    each { |todo_item| todo_item.done! }
  end

  def mark_all_undone
    each { |todo_item| todo_item.undone! }
  end

  def to_s
    output = "---- #{title} ----\n"
    @todos.each { |todo_item| output << (todo_item.to_s + "\n") }
    output
  end

  def to_a
    @todos.dup
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

list.mark_all_done
puts list.all_done
puts
list.mark_all_undone
puts list.all_not_done