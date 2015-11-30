# == Schema Information
#
# Table name: labors
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  name          :string
#  mobile        :string
#  idcard        :string
#  gender        :string
#  birthday      :date
#  channel       :string
#  province      :string
#  city          :string
#  district      :string
#  state         :string
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_labors_on_birthday       (birthday)
#  index_labors_on_channel        (channel)
#  index_labors_on_city           (city)
#  index_labors_on_deleted_at     (deleted_at)
#  index_labors_on_district       (district)
#  index_labors_on_enterprise_id  (enterprise_id)
#  index_labors_on_gender         (gender)
#  index_labors_on_idcard         (idcard)
#  index_labors_on_mobile         (mobile)
#  index_labors_on_name           (name)
#  index_labors_on_province       (province)
#  index_labors_on_state          (state)
#

require 'rails_helper'

RSpec.describe Labor, type: :model do
  it { should belong_to(:enterprise) }
  it { should have_one(:intention) }

	it "标准数据" do
		expect(build(:labor)).to be_valid
	end

	describe '用户名' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2) }
    it { should validate_length_of(:name).is_at_most(10) }
    pending '敏感词及特殊字符过滤'
  end

  describe '手机号码' do
    it { should validate_presence_of(:mobile) }
    it do
      should allow_value(
        # 无修饰符、空格修饰、横线修饰、国家代码
        '18621248234', '186 2124 8234', '186-2124-8234',
        '+86 18621248234', '+086 18621248234', '+0086 18621248234',
      ).for(:mobile)
    end

    # it do
    #   should_not allow_value('123', 'abc').for(:mobile)
    # end
		pending '错误格式测试....'
  end

  describe '身份证' do
      it { should validate_presence_of(:idcard) }
      it do
        should allow_value(
          '340621198711255616', '34062119810127561X'
        ).for(:idcard)
      end
      it do
        should_not allow_value(
          # 17位， 19位， 结尾字母不是X
          '34062119871125561', '3406211987112556161', '34062119810127561Y'
        ).for(:idcard)
      end
  end

  describe '性别' do
    it { should enumerize(:gender).in(:male, :female) }
  end

  describe '来源(渠道)' do
      it { should enumerize(:channel).in(:web) }
  end

  describe '当前状态' do
      pending 'AASM测试'
  end

  describe '生日' do
      it { should validate_presence_of(:birthday) }
      it { should allow_value('1987-11-25', '1986-02-14').for(:birthday) }
      pending '需要更多测试'
  end
end
