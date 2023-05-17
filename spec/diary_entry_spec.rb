require 'diary_entry'

RSpec.describe DiaryEntry do
    it "returns added title" do
        diary_entry = DiaryEntry.new("my_title", "my_contents")
        expect(diary_entry.title).to eq "my_title"
    end

    it "returns added title" do
        diary_entry = DiaryEntry.new("my_title", "my_contents")
        expect(diary_entry.contents).to eq "my_contents"
    end

     describe "count_words method" do
        it "counts words in contents" do
        diary_entry = DiaryEntry.new("my_title", "one two three four five")
        expect(diary_entry.count_words).to eq 5
        end

        it "returns count of zero if contents empty" do
            diary_entry = DiaryEntry.new("my_title", "")
            expect(diary_entry.count_words).to eq 0
        end
    
     end

     describe "reading_time method" do
        context "given a wpm of some sensible number (200)" do
            it "returns the ceiling of the number of the number of minutes it takes to read the content" do
              diary_entry = DiaryEntry.new("my_title", "one " * 550)
              expect(diary_entry.reading_time(200)).to eq 3
            end
        end

        context "given a wpm of 0" do
            it "fails" do
                diary_entry = DiaryEntry.new("my_title", "one two three")
                expect { diary_entry.reading_time(0) }.to raise_error "Reading speed must be above 0"
            end
        end
    end

end
