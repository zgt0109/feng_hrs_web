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

FactoryGirl.define do
  factory :job_commission_person do
    association :job
    gender "male"
    amount 10
    unit "perday"
    deadline 10
    check 10
    remit 10
  end

end
