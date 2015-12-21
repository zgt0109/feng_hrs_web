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

class VerifyStatus < ActiveRecord::Base
  include AASM
  belongs_to :verification, polymorphic: true

  aasm column: :status do
    state :verifying
    state :verified
    state :refused

    event :apply do
      transitions from: :neither, to: :verifying
    end

    event :pass do
      transitions from: :verifying, to: :verified
    end

    event :refuse do
      transitions from: :verifying, to: :refused
    end

    event :reapply do
      transitions from: [:verifying, :refused, :verified], to: :verifying
    end

    event :cancel do
      transitions from: [:verifying, :verified, :refused], to: :neither
    end
  end
end
