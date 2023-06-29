# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'is valid with name, content and deadline' do
    task = Task.new(
      name: 'Test task',
      content: 'Test content',
      deadline: Date.current + 1.day
    )
    expect(task).to be_valid
  end

  it 'is invalid without a name' do
    task = Task.new(name: nil)
    task.valid?
    expect(task.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a content' do
    task = Task.new(content: nil)
    task.valid?
    expect(task.errors[:content]).to include("can't be blank")
  end

  it 'is invalid with a deadline in the past' do
    task = Task.new(deadline: Date.current - 1.day)
    task.valid?
    expect(task.errors[:deadline]).to include("can't be in the past")
  end
end
