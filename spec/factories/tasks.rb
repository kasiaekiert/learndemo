# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  content    :text
#  deadline   :date
#  done       :boolean          default(FALSE)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
FactoryBot.define do
  factory :task do
    name { 'Task task' }
    content { 'Test content' }
    deadline { Date.current + 1.day }
    done { false }
    user { create(:user) }
  end

  factory :task1 do
    name { 'Task for user 1' }
    content { 'Test content' }
    deadline { Date.current + 1.day }
    done { false }
    user { create(:user1) }
  end
end
