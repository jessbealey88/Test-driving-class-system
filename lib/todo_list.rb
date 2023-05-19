# File: lib/todo_list.rb
require_relative 'todo'
class TodoList
  def initialize
    @todos = []  
  end

  def add(todo) # todo is an instance of Todo
    @todos << todo
  end

  def incomplete
    incomplete_status = @todos.filter do |todo| 
      todo.done? == false
    end
    incomplete_status.map do |todo|
      todo.task 
    end
    return incomplete_status
  end

  def complete
    complete_status = @todos.filter do |todo| 
      todo.done? == true
    end
     complete_status.map do |todo|
       todo.task 
     end
     p complete_status
  end

  def give_up!
    @todos.each do |todo|
      todo.mark_done!
    end
  end
end

todo_list = TodoList.new
todo_1 = Todo.new("laundry") 
todo_list.add(todo_1)
todo_2 = Todo.new("shopping")
todo_list.add(todo_2)  
todo_list.give_up!
todo_list.complete

  