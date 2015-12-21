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

FactoryGirl.define do
  factory :verification_agent do
    association :enterprise
    front "xxx"
    back "xxx"
    name "Justin Bieber"
    idcard "320125188104221156"
  end

end
