# == Schema Information
#
# Table name: jobs
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  company_id    :integer
#  contact_id    :integer
#  name          :string
#  wage          :integer
#  unit          :string
#  worktime      :integer
#  royalty       :integer
#  bonus         :integer
#  channel       :string
#  wageday       :integer
#  wageday_unit  :string
#  advance       :integer
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_jobs_on_company_id     (company_id)
#  index_jobs_on_contact_id     (contact_id)
#  index_jobs_on_enterprise_id  (enterprise_id)
#

FactoryGirl.define do
  factory :job do
    association :enterprise
    association :company
    association :contact
    name "Rails工程师"
    wage 10000
    unit "permonth"
    worktime 10
    royalty 1000
    bonus 2000
    channel "cash"
    wageday 15
    wageday_unit "month"
    advance 10
  end

end
