require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  describe "task crud" do
    context "new and create" do
      it "should create one task" do
        visit "/tasks/new"
        fill_in "任務名稱",	with: "task1"
        fill_in "任務內容",	with: "create task1"
        click_button '確認送出'
        expect(page).to have_text('新增成功')
      end
    end

  end

end
