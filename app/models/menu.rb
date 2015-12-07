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

class Menu < ActiveRecord::Base
  extend Enumerize

  acts_as_paranoid

  validates_presence_of :name, :domain, :uri, :icon
  validates_length_of :name, in: 3..8
  enumerize :domain, in: [:zhao, :song, :admin, :hr], scope: true
end
