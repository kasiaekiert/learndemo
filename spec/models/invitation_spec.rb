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
require 'rails_helper'

RSpec.describe Invitation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
