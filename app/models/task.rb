# frozen_string_literal: true

class Task < ApplicationRecord
  validates_presence_of :name, :content
  validate :deadline_cannot_be_in_the_past
  belongs_to :user, dependent: :destroy

  def deadline_cannot_be_in_the_past
    return unless deadline.present? && deadline < Date.today

    errors.add(:deadline, "can't be in the past")
  end
end
