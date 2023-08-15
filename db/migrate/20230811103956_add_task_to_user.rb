class AddTaskToUser < ActiveRecord::Migration[7.0]
  def up
    add_column :tasks, :user_id, :bigint, foreign_key: true, null: false
  end

  def down
    remove_column :tasks, :user_id
  end
end
