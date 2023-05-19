require 'todo_list'
require 'todo'

RSpec.describe "integration" do
    it "lists all incomplete todos that have been added to the list" do
        todo_list = TodoList.new
        todo = Todo.new("laundry")
        todo_list.add(todo)
        expect(todo_list.incomplete).to eq [todo]
    end

    it "lists multiple incomplete todos that have been added to the list" do
        todo_list = TodoList.new
        todo_1 = Todo.new("laundry")
        todo_list.add(todo_1)
        todo_2 = Todo.new("shopping")
        todo_list.add(todo_2)
        expect(todo_list.incomplete).to eq [todo_1,todo_2]
    end
    
    describe "Complete behaviour" do
        it "returns a completed task" do
            todo_list = TodoList.new
            todo = Todo.new("laundry") 
            todo.mark_done!
            todo_list.add(todo)  
            expect(todo_list.complete).to eq [todo]
        end

        it "returns completed multiple completed tasks" do
            todo_list = TodoList.new
            todo_1 = Todo.new("laundry") 
            todo_1.mark_done!
            todo_list.add(todo_1)
            todo_2 = Todo.new("shopping")
            todo_list.add(todo_2)  
            todo_2.mark_done!
            expect(todo_list.complete).to eq [todo_1,todo_2]
        end
    end

    describe "incomplete behaviour" do
        it "returns and incomplete task" do
            todo_list = TodoList.new
            todo = Todo.new("laundry") 
            todo_list.add(todo)  
            expect(todo_list.incomplete).to eq [todo]
        end

        it "returns completed multiple incomplete tasks" do
            todo_list = TodoList.new
            todo_1 = Todo.new("laundry") 
            todo_list.add(todo_1)
            todo_2 = Todo.new("shopping")
            todo_list.add(todo_2)  
            expect(todo_list.incomplete).to eq [todo_1,todo_2]
        end
    end
    describe "give_up! behaviour" do 
        it "marks all todos as done" do
            todo_list = TodoList.new
            todo_1 = Todo.new("laundry") 
            todo_list.add(todo_1)
            todo_2 = Todo.new("shopping")
            todo_list.add(todo_2)  
            todo_list.give_up!
            expect(todo_list.complete).to eq [todo_1, todo_2]  
        end
    end

end