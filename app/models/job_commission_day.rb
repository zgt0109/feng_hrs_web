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

class JobCommissionDay < ActiveRecord::Base
  extend Enumerize
  belongs_to :job

  enumerize :gender, in: [:male, :female, :unknown], default: :unknown
end
