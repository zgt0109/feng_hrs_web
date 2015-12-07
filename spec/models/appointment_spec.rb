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

require 'rails_helper'
require 'aasm/rspec'

RSpec.describe Appointment, type: :model do
  it { should belong_to(:job) }
  it { should belong_to(:labor) }
  it { should belong_to(:zhao) }
  it { should belong_to(:song) }

  it "AASM" do
    appointment = build(:appointment)
    expect(appointment).to transition_from(:appointed).to(:rejected).on_event(:reject)
    expect(appointment).to transition_from(:appointed).to(:passed).on_event(:pass)
    expect(appointment).to transition_from(:passed).to(:checkin).on_event(:checkin)
    expect(appointment).to transition_from(:passed).to(:refused).on_event(:refuse)
    expect(appointment).to transition_from(:checkin).to(:turnover).on_event(:turnover)
    expect(appointment).not_to transition_from(:appointed).to(:turnover).on_event(:reject)
  end
end
