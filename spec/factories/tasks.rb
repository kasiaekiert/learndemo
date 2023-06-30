# frozen_string_literal: true

FactoryBot.define do
  factory :Task do
    name { 'Task task' }
    content { 'Test content' }
    deadline { Date.current + 1.day }
  end
end
