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

class LaborIntention < ActiveRecord::Base
  extend Enumerize
  belongs_to :labor
  has_and_belongs_to_many :positions, join_table: 'intentions_positions',
                                      foreign_key: 'intention_id'
  # TODO: 公司等级 取名待定
	# level1:2000元以下 level2:2000-3000元 ，以此类推 3000-4000，4000-5000，5000-6000，6000-7000，7000-8000，8000以上。
	enumerize :salary, in: [:level1, :level2, :level3, :level4,
						    :level5, :level6, :level7, :level8]
end
