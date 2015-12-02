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

class Company < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :enterprise
  default_scope {order('updated_at desc')}
  validates_presence_of :name, :province, :city, :district, :address, :introduction
  validates :name, length: { in: 2..50 }, allow_blank: true
  validates :introduction, length: {minimum: 10 },allow_blank: true
  validates :address, length: {in: 5..50 }, allow_blank: true
end
