require 'diary'
require 'diary_entry'

RSpec.describe "integration" do
    it "lists added diary entries" do
        diary = Diary.new
        diary_entry = DiaryEntry.new("my_title", "my_contents")
        diary.add(diary_entry)
        expect(diary.all).to eq [diary_entry]
    end

    it "lists multiple added diary entries" do 
        diary = Diary.new
        diary_entry_1= DiaryEntry.new("my_title_1", "my_contents_1")
        diary.add(diary_entry_1)
        diary_entry_2= DiaryEntry.new("my_title_2", "my_contents_2")
        diary.add(diary_entry_2)
        expect(diary.all).to eq [diary_entry_1, diary_entry_2]
    end

end