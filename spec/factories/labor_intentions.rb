# == Schema Information
#
# Table name: labor_intentions
#
#  id         :integer          not null, primary key
#  labor_id   :integer
#  salary     :string
#  province   :string
#  city       :string
#  district   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_labor_intentions_on_city      (city)
#  index_labor_intentions_on_district  (district)
#  index_labor_intentions_on_labor_id  (labor_id)
#  index_labor_intentions_on_province  (province)
#  index_labor_intentions_on_salary    (salary)
#

FactoryGirl.define do
  factory :labor_intention do
    association :labor
    salary "level5"
    province "310000"
    city "310100"
    district "310115"
  end

end
