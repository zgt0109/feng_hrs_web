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

FactoryGirl.define do
  factory :labor do
    association :enterprise
    name "工友01"
    mobile "18621248234"
    idcard "340621198711255616"
    channel :web
    province "310000"
    city  "310100"
    district "310115"
  end

end
