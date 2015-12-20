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

FactoryGirl.define do
  factory :verify_status do
    state 'verifying1'
  end
end
