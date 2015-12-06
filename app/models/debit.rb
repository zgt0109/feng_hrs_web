# == Schema Information
#
# Table name: debits
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  bank_id       :integer
#  name          :string
#  account       :string
#  deposit       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_debits_on_account        (account)
#  index_debits_on_bank_id        (bank_id)
#  index_debits_on_enterprise_id  (enterprise_id)
#  index_debits_on_name           (name)
#

class Debit < ActiveRecord::Base
  belongs_to :enterprise
  belongs_to :bank
  has_many :cash_outs

  validates_presence_of :name, :account, :deposit
  validates :name, length: { in: 2..10 }, allow_blank: true
  validates :account, length: { in: 16..20 }, allow_blank: true
  validates :deposit, length: { in: 2..30 }, allow_blank: true
end
