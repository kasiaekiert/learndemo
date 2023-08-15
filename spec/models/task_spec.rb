# frozen_string_literal: true

require "rails_helper"
require "factory_bot_rails"
require "pry"

RSpec.describe Task, type: :model do
  let(:task) { create(:task) }

  it "is valid with name, content and deadline" do
    expect(task).to be_valid
  end

  context "Create a task without a name" do
    let(:task) { build(:task, name: nil) }

    it "is invalid without a name" do
      expect(task.valid?).to be(false)
      expect(task.errors[:name]).to include("can't be blank")
    end
  end

  context "Create a task without a content" do
    let(:task) { build(:task, content: nil) }

    it "is invalid without a content" do
      task.valid?
      expect(task.errors[:content]).to include("can't be blank")
    end
  end

  context "Create a task with deadline in the past" do
    let(:task) { build(:task, deadline: Date.current - 1.day) }

    it "is invalid with a deadline in the past" do
      task.valid?
      expect(task.errors[:deadline]).to include("can't be in the past")
    end
  end 

  context "Create a task with deadline is today" do 
    let(:task) { build(:task, deadline: Date.current) }

    it "is with a deadline today" do
      expect(task.valid?).to be(true)
    end
  end

  context "When task is undone" do
    let(:task) { create(:task) }

    it "can be updated to done" do
      task.update!(done: true)
      expect(task.done).to be true
    end
  end

  context "When task is done" do
    let(:task) { create(:task, done: true) }

    it "can be updated to undone" do
      task.update!(done: false)
      expect(task.done).to be false
    end
  end

  context "When task is created is defaulted" do
    let(:task) { create(:task) }

    it "is undone by default" do
      expect(task.done).to be false
    end
  end

  context 'When task is creating is validated' do
    it "should validate a presence of name and content" do
      should validate_presence_of(:name)
      should validate_presence_of(:content)
    end
  end
end
