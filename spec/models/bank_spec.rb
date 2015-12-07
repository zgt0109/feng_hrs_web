# == Schema Information
#
# Table name: banks
#
#  id           :integer          not null, primary key
#  name         :string
#  published_at :datetime
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Bank, type: :model do
  it { should have_many(:debits) }

  it "标准数据" do
    expect(build(:bank)).to be_valid
  end
end
