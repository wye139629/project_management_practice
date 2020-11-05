require 'rails_helper'

RSpec.feature "Tasks", type: :feature, driver: :chrome, js: true, slow: true do
  describe "task crud" do
    context "index" do
      it "render task" do
        (1..5).each do |i|
          create(:task , title: "Task #{i}")
        end
        visit tasks_path
        expect(page.all("tbody tr").to_a.map{|tr| tr.all("td").first.text}).to eq((1..5).map{|i| "Task #{i}"}.reverse)
      end

      it "user end date render" do
        (1..5).each do |i|
          create(:task , title: "Task #{i}", end_date: Time.zone.now + i.day)
        end
        visit tasks_path
        find(".end_date").click
        expect(page.all("tbody tr").to_a.map{|tr|tr.all("td").first.text}).to eq((1..5).map{|i| "Task #{i}"})
      end
    end

    context "new and create" do
      it "should create one task" do
        visit new_task_path
        fill_in "任務名稱",	with: "task1"
        fill_in "任務內容",	with: "create task1"
        fill_in "任務開始時間", with: Time.zone.now
        fill_in "任務結束時間", with: Time.zone.now + 3.day
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
        fill_in "任務開始時間", with: Time.zone.now
        fill_in "任務結束時間", with: Time.zone.now + 3.day
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
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_no_content("task title")
      end
    end
  end

end
