# == Schema Information
#
# Table name: industries
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
#  index_industries_on_deleted_at  (deleted_at)
#  index_industries_on_lft         (lft)
#  index_industries_on_name        (name)
#  index_industries_on_name_seo    (name_seo)
#  index_industries_on_parent_id   (parent_id)
#  index_industries_on_rgt         (rgt)
#

FactoryGirl.define do
  factory :industry do
    name "财务/金融/保险"
    name_seo "jirong"
  end

end
