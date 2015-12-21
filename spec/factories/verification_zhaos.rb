# == Schema Information
#
# Table name: verification_zhaos
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  industry_id   :integer
#  image_url     :string
#  name          :string
#  short_name    :string
#  nature        :string
#  scale         :string
#  mobile        :string
#  website       :string
#  province      :string
#  city          :string
#  district      :string
#  address       :string
#  introduction  :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_verification_zhaos_on_enterprise_id  (enterprise_id)
#  index_verification_zhaos_on_industry_id    (industry_id)
#

FactoryGirl.define do
  factory :verification_zhao do
    association :enterprise
    image_url "picurl"
    name "name1"
    short_name "name_short"
    nature "single"
    industry "science"
    scale "more than 100"
    mobile "13087654321"
    website "www.xxx.com"
    location "Shanghai"
    introduction "a plain bussiness"
  end

end
