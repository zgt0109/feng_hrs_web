# == Schema Information
#
# Table name: verify_statuses
#
#  id                :integer          not null, primary key
#  verification_id   :integer
#  verification_type :string
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe VerifyStatus, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
