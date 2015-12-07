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

require 'rails_helper'

RSpec.describe Job, type: :model do
  it "标准数据" do
    expect(build(:job)).to be_valid
  end

  it { should belong_to(:enterprise) }
  it { should belong_to(:contact) }
  it { should belong_to(:company) }
  it { should have_one(:job_quantity) }
  it { should have_many(:job_commission_people) }
  it { should have_many(:job_commission_days) }
  it { should accept_nested_attributes_for(:job_quantity).allow_destroy(true) }
  it { should accept_nested_attributes_for(:job_commission_people).allow_destroy(true) }
  it { should accept_nested_attributes_for(:job_commission_days).allow_destroy(true) }

  describe "岗位标题" do
    it { should validate_presence_of(:name) }
  end

  describe "薪资" do
    it { should validate_presence_of(:wage) }
  end

  describe "薪资单位" do
    it { should validate_presence_of(:unit) }
  end

  describe "工作时间" do
    it { should validate_presence_of(:worktime) }
  end

  describe "提成" do
    # it { should validate_presence_of(:royalty) }
  end

  describe "奖金" do
    # it { should validate_presence_of(:bonus) }
  end

  describe "工资发放方式" do
    it { should validate_presence_of(:channel) }
  end

  describe "工资发放日" do
    it { should validate_presence_of(:wageday) }
  end

  describe "工资发单位" do
    it { should validate_presence_of(:wageday_unit) }
  end

  describe "预支工资" do
    # it { should validate_presence_of(:advance) }
  end

end
