# == Schema Information
#
# Table name: cash_ins
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  amount        :decimal(10, 2)
#  serial_outer  :string
#  serial_inner  :string
#  channel       :string
#  state         :string
#  note          :string
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_cash_ins_on_enterprise_id  (enterprise_id)
#

FactoryGirl.define do
  factory :cash_in do
    association :enterprise
    amount "9.99"
    serial_inner "anc1234"
    serial_outer "bca4321"
    channel "网银支付"
    note "Hello World"
  end

end
