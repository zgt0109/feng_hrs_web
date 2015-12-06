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

require 'rails_helper'

RSpec.describe CashIn, type: :model do
  it {should belong_to(:enterprise) }

  it "标准数据" do
    expect(build(:cash_in)).to be_valid
  end

  describe "金额" do
    it { should validate_numericality_of(:amount) }
  end

  describe "银行流水号" do
    it { should validate_presence_of(:serial_inner) }
  end

  describe "内部流水号和渠道" do
    it { should validate_presence_of(:serial_outer) }
    it { should validate_presence_of(:channel) }
  end

  describe "状态" do
    pending 'AASM测试'
  end
end
