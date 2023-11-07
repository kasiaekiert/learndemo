# == Schema Information
#
# Table name: invitations
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  invited_by_id :bigint           not null
#  invited_id    :bigint           not null
#
# Indexes
#
#  index_invitations_on_invited_by_id  (invited_by_id)
#  index_invitations_on_invited_id     (invited_id)
#
FactoryBot.define do
  factory :invitation do
    
  end
end
