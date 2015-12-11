# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  name       :string
#  domain     :string
#  uri        :string
#  icon       :string
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :menu do
    name "导航菜单"
    domain "admin"
    uri "/admin/menus"
    icon 'content'
  end

end
