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

class Job < ActiveRecord::Base
  extend Enumerize
  belongs_to :enterprise
  belongs_to :company
  belongs_to :contact

  enumerize :unit, in: [:permonth, :perhour], default: :permonth
  enumerize :channel, in: [:cash, :card], default: :cash
  enumerize :wageday_unit, in: [:month, :day], default: :month

  validates_presence_of :name, :wage, :unit, :worktime, :royalty, :bonus,
                        :channel, :wageday, :wageday_unit, :advance

  default_scope { order("updated_at desc") }
end
