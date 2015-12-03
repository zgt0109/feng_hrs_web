# == Schema Information
#
# Table name: job_commission_days
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  gender     :string
#  deadline   :integer
#  amount     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_job_commission_days_on_job_id  (job_id)
#

FactoryGirl.define do
  factory :job_commission_day do
    association :job
    gender "male"
    deadline 10
    amount 1000
  end

end
