# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  job_id     :integer
#  labor_id   :integer
#  zhao_id    :integer
#  song_id    :integer
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_appointments_on_job_id    (job_id)
#  index_appointments_on_labor_id  (labor_id)
#  index_appointments_on_song_id   (song_id)
#  index_appointments_on_state     (state)
#  index_appointments_on_zhao_id   (zhao_id)
#

class Appointment < ActiveRecord::Base
  include AASM
  belongs_to :job
  belongs_to :labor
  belongs_to :zhao, class_name: 'Enterprise', foreign_key: :zhao_id
  belongs_to :song, class_name: 'Enterprise', foreign_key: :song_id

  before_create{
    self.zhao = self.job.enterprise
    self.song = self.labor.enterprise
  }

  default_scope { order('updated_at desc') }

  aasm column: :state do
    state :yibaoming, :initial => true
    state :yimianshi
    state :yiruzhi
    state :yilizhi
    state :weiruzhi
  end
end
