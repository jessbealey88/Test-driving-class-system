require 'diary'

RSpec.describe Diary do
    it "initializes with empty list" do
        diary_entry = Diary.new
        expect(diary_entry.all).to eq []
    end
end

