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

class JobCommissionPerson < ActiveRecord::Base
  extend Enumerize
  belongs_to :job

  enumerize :gender, in: [:male, :female, :unknown], default: :unknown
  enumerize :unit, in: [:permonth, :perhour]

end
