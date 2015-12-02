# == Schema Information
#
# Table name: banks
#
#  id           :integer          not null, primary key
#  name         :string
#  published_at :datetime
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Bank < ActiveRecord::Base
  acts_as_paranoid
	has_many :debits

	scope :published, -> { where.not(published_at: nil) }
	def published?
		published_at.present?
	end

	def mark_as_published!
		updated_column :published_at, Time.zone.now
	end

	def mark_as_draft!
		updated_column :published_at, nil
	end
end
