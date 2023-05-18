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

    describe "word counting behaviour" do
        it "counts the words in all entries" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my_title_1", "one two")
            diary_entry_2= DiaryEntry.new("my_title_2", "three four five")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.count_words).to eq 5
        end
    end

    describe "reading time behaviour" do
        it "fails when wpm is 0" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my_title_1", "one two")
            diary.add(diary_entry_1)
            expect{ diary.reading_time(0) }.to raise_error "WPM must be positive."
        end  

        it "calculates reading time for all entries where time fits exactly" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my_title_1", "one two three")
            diary_entry_2= DiaryEntry.new("my_title_2", "four five six")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.reading_time(2)).to eq 3
        end

        it "calculates reading time for all entries where time doesn't fit exactly" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my_title_1", "one two")
            diary_entry_2= DiaryEntry.new("my_title_2", "three four five")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.reading_time(2)).to eq 3
        end
    end

    describe "reading time entry behaviour" do
        it "fails where wpm is 0" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my_title_1", "one two")
            diary.add(diary_entry_1)
            expect{ diary.find_best_entry_for_reading_time(0,1)}.to raise_error "WPM must be positive."
        end
        it "returns entry where we have just one entry and it is readable in the time" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my_title_1", "one two")
            diary.add(diary_entry_1)
            expect(diary.find_best_entry_for_reading_time(2,1)).to eq diary_entry_1
        end

        it "returns nil where we have just one entry and it is unreadable in the time" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my_title_1", "one two three")
            diary.add(diary_entry_1)
            expect(diary.find_best_entry_for_reading_time(2,1)).to eq nil
        end

        it "returns the longest entry the user could read in the time where there are multiple entries" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my_title_1", "one two")
            diary.add(diary_entry_1)
            diary.add(DiaryEntry.new("my_title_1", "one"))
            diary.add(DiaryEntry.new("my_title_1", "one two three"))
            diary.add(DiaryEntry.new("my_title_1", "one two three four"))
            expect(diary.find_best_entry_for_reading_time(2,1)).to eq diary_entry_1
        end    
    end

end