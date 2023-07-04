# frozen_string_literal: true

require "rails_helper"

RSpec.describe Task, type: :model do
  let(:task) { FactoryBot.create(:task) }

  it "is valid with name, content and deadline" do
    expect(task).to be_valid
  end

  it "is invalid without a name" do
    task = Task.new(name: nil)
    task.valid?
    expect(task.errors[:name]).to include("can't be blank")

    #is_expected.to validate_uniqueness_of
  end

  # it "validates uniqueness of name" do
  #   should validates_presence_of(:name)
  # end

  it "is invalid without a content" do
    task = Task.new(content: nil)
    task.valid?
    expect(task.errors[:content]).to include("can't be blank")
  end

  it "is invalid with a deadline in the past" do
    task = Task.new(deadline: Date.current - 1.day)
    task.valid?
    expect(task.errors[:deadline]).to include("can't be in the past")
  end

  it "is with a deadline with current data" do
    task = Task.new(deadline: Date.today - 1.day)
    task.valid?
    expect(task.errors[:deadline]).to include("can't be in the past")
  end

  it "is done when it was done" do
    task = Task.new(done: true)
    task.valid?
    expect(task.done).to be(true)
  end

  it "does not have a state of to be done" do
    task.valid?
    expect(task.done).to be(nil)
  end
end
