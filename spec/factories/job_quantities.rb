# == Schema Information
#
# Table name: job_quantities
#
#  id                :integer          not null, primary key
#  job_id            :integer
#  wish_male_count   :integer
#  wish_female_count :integer
#  wish_unkown_count :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_job_quantities_on_job_id  (job_id)
#

FactoryGirl.define do
  factory :job_quantity do
    association :job
    wish_male_count nil
    wish_female_count nil
    wish_unkown_count 100
  end

end
