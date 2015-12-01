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

class Contact < ActiveRecord::Base
  acts_as_paranoid
  extend Enumerize
  belongs_to :enterprise

  enumerize :gender, in: [:male, :female], default: :male

  validates_presence_of :name, :mobile, :gender
  validates :name, length: { in: 2..10 }, allow_blank: true
  validates :mobile, format: { with: /\A1[3|4|5|7|8][0-9]{9}\Z/ }, allow_blank: true

  before_validation :filter_mobile

  default_scope { order('updated_at desc') }

  def filter_mobile
    self.mobile.gsub!(/(^\+0{0,2}86)|\s|-|/, '') unless self.mobile.nil?
  end
end
