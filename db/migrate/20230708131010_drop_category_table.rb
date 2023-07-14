# frozen_string_literal: true

# Task does not have a category

class DropCategoryTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :categories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
