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

FactoryGirl.define do
  factory :bank do
    name "招商银行"
  end

end
