# == Schema Information
#
# Table name: contacts
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  name          :string
#  mobile        :string
#  gender        :string
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_contacts_on_deleted_at     (deleted_at)
#  index_contacts_on_enterprise_id  (enterprise_id)
#  index_contacts_on_gender         (gender)
#  index_contacts_on_mobile         (mobile)
#  index_contacts_on_name           (name)
#

FactoryGirl.define do
  factory :contact do
    association :enterprise
    name "联系人1号"
    mobile "13092617908"
    gender "male"
  end

end
