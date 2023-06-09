# frozen_string_literal: true

class AddDetailsToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :deadline, :date
    add_column :tasks, :done, :boolean
  end
end
