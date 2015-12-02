# == Schema Information
#
# Table name: companies
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  name          :string
#  province      :string
#  city          :string
#  district      :string
#  address       :string
#  introduction  :text
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_companies_on_city           (city)
#  index_companies_on_deleted_at     (deleted_at)
#  index_companies_on_district       (district)
#  index_companies_on_enterprise_id  (enterprise_id)
#  index_companies_on_name           (name)
#  index_companies_on_province       (province)
#

require 'rails_helper'

RSpec.describe Company, type: :model do
  it "标准数据" do
    expect(build(:company)).to be_valid
  end

  it {should belong_to(:enterprise)}

  describe "公司名称" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2)}
    it { should validate_length_of(:name).is_at_most(50)}
    pending '敏感词及特殊字符过滤'
  end

  describe "公司介绍" do
    it { should validate_presence_of(:introduction)}
    it { should validate_length_of(:introduction).is_at_least(10)}
    pending '敏感词及特殊字符过滤'
  end

  describe "公司地址" do
    it { should validate_presence_of(:province)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:district)}
    it { should validate_presence_of(:address)}
    it { should validate_length_of(:address).is_at_least(5)}
    it { should validate_length_of(:address).is_at_most(50)}
    pending '敏感词及特殊字符过滤'
  end
end
