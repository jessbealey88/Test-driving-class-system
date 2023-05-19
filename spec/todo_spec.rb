require 'todo'

RSpec.describe Todo do 
    it "initializes with a task" do
        todo = Todo.new("task_1")
        expect(todo.task).to eq "task_1"
    end

    it "initializes with task not yet done" do
        todo = Todo.new("task_1")
        expect(todo.done?).to eq false
    end

    it "fails if initializes with an empty task" do
        expect{Todo.new("")}.to raise_error "Please enter a task to add to the list"
    end
        
    describe "marked done behaviour" do
        it "marks the task as done" do
            todo = Todo.new("task_1")  
            todo.mark_done!
            expect(todo.done?).to eq true
        end
 
    end


end