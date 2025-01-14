class AddTaskToLists < ActiveRecord::Migration[8.0]
  def change
    add_column :lists, :task, :string
  end
end
