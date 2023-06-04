class Task < ApplicationRecord
  validates_presence_of :name, :content
  validate :deadline_cannot_be_in_the_past
 
  def deadline_cannot_be_in_the_past
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, "can't be in the past")
    end
  end
end
