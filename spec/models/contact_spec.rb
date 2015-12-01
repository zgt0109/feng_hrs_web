# == Schema Information
#
# Table name: contacts
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  name          :string
#  mobile        :string
#  gender        :string
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_contacts_on_deleted_at     (deleted_at)
#  index_contacts_on_enterprise_id  (enterprise_id)
#  index_contacts_on_gender         (gender)
#  index_contacts_on_mobile         (mobile)
#  index_contacts_on_name           (name)
#

require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { should belong_to(:enterprise) }

  it "标准数据" do
    expect(build(:contact)).to be_valid
  end

  describe "姓名" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_length_of(:name).is_at_most(10) }
  end

  describe "手机号码" do
    it { should validate_presence_of(:mobile) }
    it "过滤多余字符" do
      contact = build(:contact, mobile: '186-2124-8234')
      expect(contact.filter_mobile).to eq '18621248234'
    end

    it do
      should allow_value(
        # 无修饰符、空格修饰、横线修饰、国家代码
        '18621248234', '186 2124 8234', '186-2124-8234',
        '+86 18621248234', '+086 18621248234', '+0086 18621248234',
      ).for(:mobile)
    end
    # it do
    #   should_not allow_value('123', 'abc', '186212482345').for(:mobile)
    # end
    pending '错误格式测试....'
  end

  describe "性别" do
    it { should enumerize(:gender).in(:male, :female) }
  end
end
