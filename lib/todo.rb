# File: lib/todo.rb
class Todo
    def initialize(task) # task is a string
      @todo = task
      @done = false
    end
  
    def task
      @todo
    end
  
    def mark_done!
     @done = true
    end
  
    def done?
      @done
    end
  end