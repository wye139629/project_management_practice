require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "Task validation" do
    it "title validate" do
      task = Task.create(title: nil, content: "test")
      expect(task).to_not be_valid
      task = create(:task)
      expect(task).to be_valid
    end

    it "content validate" do
      task = Task.create(title: "task", content: nil)
      expect(task).to_not be_valid
      task = create(:task)
      expect(task).to be_valid
    end
  end
end
