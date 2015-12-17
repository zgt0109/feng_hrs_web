# == Schema Information
#
# Table name: verification_zhaos
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  image_url     :string
#  name          :string
#  short_name    :string
#  nature        :string
#  industry      :string
#  scale         :string
#  mobile        :string
#  website       :string
#  province      :string
#  city          :string
#  district      :string
#  address       :string
#  introduction  :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_verification_zhaos_on_enterprise_id  (enterprise_id)
#

class VerificationZhao < ActiveRecord::Base
  extend Enumerize
  belongs_to :enterprise

  validates_presence_of :name, :nature, :industry, :scale, :mobile, :image_url,
                        :province, :city, :district, :address, :introduction

  enumerize :nature, in: ['state', 'collective', 'joint', 'foreign', 'private', 'others']
  enumerize :scale, in: ['l50', 'l100', 'm100']

  def license_url
    'http://' + ENV['QINIU_BUCKET_DOMAIN'] + '/' + (self.image_url || 'user_default.jpg') + '-license'
  end
end
