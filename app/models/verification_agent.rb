# == Schema Information
#
# Table name: verification_agents
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  front         :string
#  back          :string
#  name          :string
#  idcard        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_verification_agents_on_enterprise_id  (enterprise_id)
#

class VerificationAgent < ActiveRecord::Base
  include SharedMethods
  belongs_to :enterprise
  has_one :verify_status, as: :verification

  def image_url(param)
    'http://' + ENV['QINIU_BUCKET_DOMAIN'] + '/' + (self.send(param) || 'user_default.jpg') + '-license'
  end

  after_create :create_verify_status
  after_update :edit_verify_status
end
