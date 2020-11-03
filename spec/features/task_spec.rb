require 'rails_helper'

RSpec.feature "Tasks", type: :feature do
  describe "task crud" do
    context "index" do
      it "index" do
        task1 = create(:task)
        task2 = create(:task)
        visit "/tasks"

        expect(page).to have_content("this is task test", count: 2)
      end
    end

    context "new and create" do
      it "should create one task" do
        visit new_task_path
        fill_in "任務名稱",	with: "task1"
        fill_in "任務內容",	with: "create task1"
        click_button '確認送出'

        expect(page).to have_text('新增成功')
        expect(page).to have_text('task1')
        expect(page).to have_text('create task1')
      end
    end

    context "edit and update" do
      it "should edit task" do
        task = create(:task)
        visit edit_task_path(task)
        fill_in "任務名稱", with: "modified task name"
        fill_in "任務內容", with: "modified task content"
        click_button "確認送出"

        expect(page).to have_text("編輯成功")
      end
    end

    context "destroy" do
      it "should delete task" do
        task = create(:task)
        visit tasks_path
        expect(page).to have_content("task title")
        click_link "刪除"
        expect(page).to have_no_content("task title")
      end
    end
  end

end
