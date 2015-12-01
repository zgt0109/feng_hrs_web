# == Schema Information
#
# Table name: positions
#
#  id         :integer          not null, primary key
#  name       :string
#  name_seo   :string
#  parent_id  :integer
#  lft        :integer
#  rgt        :integer
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_positions_on_deleted_at  (deleted_at)
#  index_positions_on_lft         (lft)
#  index_positions_on_name        (name)
#  index_positions_on_name_seo    (name_seo)
#  index_positions_on_parent_id   (parent_id)
#  index_positions_on_rgt         (rgt)
#

FactoryGirl.define do
  factory :position do
    name "服务员"
    name_seo "fuwuyuan"
  end

end
