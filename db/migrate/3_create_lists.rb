class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :task, null: false
      t.references :todo_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
