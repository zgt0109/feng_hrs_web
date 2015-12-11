# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  name       :string
#  domain     :string
#  uri        :string
#  icon       :string
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Menu, type: :model do
  it "标准数据" do
    expect(build(:menu)).to be_valid
  end


  describe "菜单名称" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_length_of(:name).is_at_most(8) }
  end

  describe "所属空间" do
    it { should validate_presence_of(:domain) }
  end

  describe "链接地址" do
    it { should validate_presence_of(:uri) }
  end

  describe "图标" do
    it { should validate_presence_of(:icon) }
  end
end
