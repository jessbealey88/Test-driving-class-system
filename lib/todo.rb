# File: lib/todo.rb
class Todo
  def initialize(task) 
    fail "Please enter a task to add to the list" if task.empty?
    @todo = [task, ""]
  end

  def task
    @todo[0]
  end

  def mark_done!
    @todo[1]="done"
  end

  def done?
    if @todo.include?("done")
       true
    else
       false
    end
  end
end

