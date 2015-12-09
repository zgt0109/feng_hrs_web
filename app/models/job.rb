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
#  royalty       :string
#  bonus         :string
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

class Job < ActiveRecord::Base
  extend Enumerize
  belongs_to :enterprise
  belongs_to :company
  belongs_to :contact
  has_one :job_quantity
  has_many :job_commission_people
  has_many :job_commission_days
  acts_as_taggable_on :worktime

  accepts_nested_attributes_for :job_quantity, :job_commission_people,
                                :job_commission_days, allow_destroy: true

  enumerize :unit, in: [:permonth, :perhour], default: :permonth
  enumerize :channel, in: [:cash, :card], default: :cash
  enumerize :wageday_unit, in: [:month, :day], default: :month

  validates_presence_of :name, :wage, :unit, :worktime_list,
                        :channel, :wageday, :wageday_unit

  default_scope { order("updated_at desc") }
end
