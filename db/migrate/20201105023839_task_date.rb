class TaskDate < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :start_date, :datetime, null: false
    add_column :tasks, :end_date, :datetime, null: false
  end
end
