require 'todo_list'
require 'todo'

RSpec.describe "integration" do
    it "lists all incomplete todos" do
        todo_list = TodoList.new
        todo = Todo.new("laundry")
        todo_list.add(todo.task)
        expect(todo_list.incomplete).to eq ["laundry"]
    end

    xit "lists multiple incomplete todos" do
    end

    xit "" do
    end
    
    describe "Complete behaviour" do
        it "returns a completed task" do
            todo_list = TodoList.new
            todo = Todo.new("laundry") 
            todo.mark_done!
            todo_list.add(todo.task)  
            expect(todo_list.complete).to eq ["laundry"]
        end
    end

end