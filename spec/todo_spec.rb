require 'todo'

RSpec.describe Todo do 
    it "initializes with a class" do
        todo = Todo.new("task_1")
        expect(todo.task).to eq "task_1"
    end

    it "initializes with task not yet done" do
        todo = Todo.new("task_1")
        expect(todo.done?).to eq false
    end

    describe "mark_done method" do
        it "marks the task as done" do
            todo = Todo.new("task_1")  
            todo.mark_done!
            expect(todo.done?).to eq true
        end
    end


end