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
class Task < ApplicationRecord
  validates_presence_of :name, :content
  validate :deadline_cannot_be_in_the_past
  belongs_to :user

  def deadline_cannot_be_in_the_past
    return unless deadline.present? && deadline < Date.today

    errors.add(:deadline, "can't be in the past")
  end
end
