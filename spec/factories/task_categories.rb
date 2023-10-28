# == Schema Information
#
# Table name: task_categories
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer          not null
#  task_id     :integer          not null
#
# Indexes
#
#  index_task_categories_on_category_id              (category_id)
#  index_task_categories_on_task_id                  (task_id)
#  index_task_categories_on_task_id_and_category_id  (task_id,category_id) UNIQUE
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#  task_id      (task_id => tasks.id)
#
FactoryBot.define do
  factory :task_category do
    task { nil }
    category { nil }
  end
end
