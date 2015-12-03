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

require 'rails_helper'

RSpec.describe Debit, type: :model do
  it { should belong_to(:enterprise) }
  it { should belong_to(:bank) }

  it "标准数据" do
    expect(build(:debit)).to be_valid
  end

  describe "用户名" do
  	it { should have_db_column(:name).of_type(:string) }
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_length_of(:name).is_at_most(10) }
    pending '敏感词及特殊字符过滤'
  end

  describe "银行卡号" do
  	it { should have_db_column(:account).of_type(:string) }
    it { should validate_presence_of(:account) }
    it { should validate_length_of(:account).is_at_least(16) }
    it { should validate_length_of(:account).is_at_most(20) }
  end

  describe "开户行" do
  	it { should have_db_column(:deposit).of_type(:string) }
    it { should validate_presence_of(:deposit) }
    it { should validate_length_of(:deposit).is_at_least(2) }
    it { should validate_length_of(:deposit).is_at_most(30) }
  end
end
