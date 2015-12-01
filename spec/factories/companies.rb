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

FactoryGirl.define do
  factory :company do
    association :enterprise
    name "淘帮忙"
    province "310000"
    city  "310100"
    district "310115"
    address "上海外高桥保税区富特北路18号联安大厦5楼"
    introduction "淘帮忙项目起源地, 希望我们能离梦想更进一步"
  end

end
