# == Schema Information
#
# Table name: cash_outs
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  bank_id       :integer
#  debit_id      :integer
#  amount        :decimal(10, 2)
#  serial_outer  :string
#  serial_inner  :string
#  state         :string
#  note          :string
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_cash_outs_on_bank_id        (bank_id)
#  index_cash_outs_on_debit_id       (debit_id)
#  index_cash_outs_on_enterprise_id  (enterprise_id)
#

FactoryGirl.define do
  factory :cash_out do
    association :enterprise
    association :bank
    association :debit
    amount "9.99"
    serial_inner "anc1234411"
    serial_outer "bca4321112"
    note "Hello World"
  end

end
