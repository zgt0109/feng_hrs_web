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

class Position < ActiveRecord::Base
  acts_as_nested_set
  acts_as_paranoid

  has_and_belongs_to_many :intentions, class_name: 'LaborIntention',
                                       join_table: 'intentions_positions',
                                       association_foreign_key: 'intention_id'
  validates_presence_of :name, :name_seo
  validates :name, :name_seo, length:{ in: 2..20}, allow_blank: true
  validates_uniqueness_of :name_seo, case_sensitive: false, allow_blank: true
end
