# == Schema Information
#
# Table name: job_commission_people
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  gender     :string
#  amount     :integer
#  unit       :string
#  deadline   :integer
#  check      :integer
#  remit      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_job_commission_people_on_job_id  (job_id)
#

require 'rails_helper'

RSpec.describe JobCommissionPerson, type: :model do
  it { should belong_to(:job) }
end
