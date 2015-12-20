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

require 'rails_helper'

RSpec.describe VerificationZhao, type: :model do
  it { should belong_to(:enterprise) }
  it { should have_one(:verify_status) }
end
