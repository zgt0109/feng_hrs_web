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

require 'rails_helper'
require 'pry'

RSpec.describe VerificationAgent, type: :model do
  it "状态的转变" do
    # enterprise = create(:enterprise)
    agent = create(:verification_agent)
    sta = agent.verify_status
    expect(sta.status).to eq('verifying')
    sta.pass!
    expect(sta.status).to eq('verified')
    agent.update(name: 'justin')
    expect(sta.status).to eq('verifying')
  end
end
