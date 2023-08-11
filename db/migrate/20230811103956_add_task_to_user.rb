class AddTaskToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :user_id, :integer
    add_foreign_key :tasks, :users
  end
end
