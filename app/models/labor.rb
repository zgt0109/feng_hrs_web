# == Schema Information
#
# Table name: labors
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  name          :string
#  mobile        :string
#  idcard        :string
#  gender        :string
#  birthday      :date
#  channel       :string
#  province      :string
#  city          :string
#  district      :string
#  state         :string
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_labors_on_birthday       (birthday)
#  index_labors_on_channel        (channel)
#  index_labors_on_city           (city)
#  index_labors_on_deleted_at     (deleted_at)
#  index_labors_on_district       (district)
#  index_labors_on_enterprise_id  (enterprise_id)
#  index_labors_on_gender         (gender)
#  index_labors_on_idcard         (idcard)
#  index_labors_on_mobile         (mobile)
#  index_labors_on_name           (name)
#  index_labors_on_province       (province)
#  index_labors_on_state          (state)
#

class Labor < ActiveRecord::Base
  acts_as_paranoid
  extend Enumerize
  include AASM
  belongs_to :enterprise
  has_one :intention, class_name: 'LaborIntention'
  has_one :appointment
  has_one :job, through: :appointment
  accepts_nested_attributes_for :intention
  validates_presence_of :name, :mobile, :idcard, :gender, :channel, :birthday,
                        :province, :city, :district
  validates :name, length: { in: 2..10 }, allow_blank: true
  validates :mobile, format:{ with: /\A1[3|4|5|7|8][0-9]{9}\Z/}, allow_blank: true
  validates :idcard, format:{ with: /\d{18}|\d{17}X/}, allow_blank: true
  validates :birthday, format:{ with: /\d{4}\-\d{2}\-\d{2}/}, allow_blank: true
  before_validation :filter_mobile
  before_validation :parse_idcard

  enumerize :gender, in: [:male, :female]
  enumerize :channel, in: [:web]

  aasm column: :state do
    state :registed, :initial => true
    state :appointed
    state :passed
    state :rejected
    state :checkin
    state :refused
    state :turnover

    event :appoint do
      transitions :from => :registed, :to => :appointed
    end

    event :cancel do
      transitions :from => :appointed, :to => :registed
    end

    event :reject do
      transitions :from => :appointed, :to => :rejected
    end

    event :pass do
      transitions :from => :appointed, :to => :passed
    end

    event :checkin do
      transitions :from => :passed, :to => :checkin
    end

    event :refuse do
      transitions :from => :passed, :to => :refused
    end

    event :turnover do
      transitions :from => :checkin, :to => :turnover
    end
  end

  private
    def filter_mobile
      self.mobile.gsub!(/(^\+0{0,2}86)|\s|-|/, '') unless self.mobile.nil?
    end

    def parse_idcard
      unless self.idcard.blank?
        self.idcard.upcase!
        self.birthday = "#{self.idcard.slice(6,4)}-#{self.idcard.slice(10,2)}-#{self.idcard.slice(12,2)}"
        self.gender= self.idcard.slice(16,1)%2 ? 'male' : 'female'
      end
    end
end
