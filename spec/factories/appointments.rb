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

FactoryGirl.define do
  factory :appointment do
    association :job
    association :labor
    association :zhao, factory: :enterprise
    association :song, factory: :enterprise
  end

end
