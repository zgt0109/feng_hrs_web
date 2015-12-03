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

FactoryGirl.define do
  factory :debit do
    association :enterprise
  	association :bank
    name "借记卡1号"
    account "1234567898123456"
    deposit "武汉东湖经济开发区招商银行东湖支行"
  end

end
