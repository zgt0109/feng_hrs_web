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

require 'rails_helper'

RSpec.describe CashOut, type: :model do
  it {should belong_to(:enterprise) }
  it {should belong_to(:bank) }
  it {should belong_to(:debit) }

  it "标准数据" do
    expect(build(:cash_out)).to be_valid
  end

  describe "金额" do
    it { should validate_numericality_of(:amount) }
  end

  describe "银行流水号" do
    it { should validate_presence_of(:serial_inner) }
  end

  describe "内部流水号" do
    it { should validate_presence_of(:serial_outer) }
  end

  describe "状态" do
    pending 'AASM测试'
  end
end
