# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { 'Task task' }
    content { 'Test content' }
    deadline { Date.current + 1.day }
    done { false }
  end
end
