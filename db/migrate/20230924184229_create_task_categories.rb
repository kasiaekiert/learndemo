class CreateTaskCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :task_categories do |t|
      t.references :task, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps

      t.index [:task_id, :category_id], unique: true
    end
  end
end
