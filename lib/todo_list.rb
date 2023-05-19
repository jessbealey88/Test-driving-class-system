# File: lib/todo_list.rb
class TodoList
    def initialize
        @todos = []  
        @completed_todos = []
    end
  
    def add(todo) # todo is an instance of Todo
      @todos << todo
    end
  
    def incomplete
      return @todos
    end
  
    def complete
        @todos.map do |todo|
        if todo.done? == true
          @completed_todos << todo
          @todos.delete(todo)
        end
        return @completed_todos
      end
    end
  
    def give_up!
      @completed_todos << @todos
      return @completed_todos
    end
  end
  
  