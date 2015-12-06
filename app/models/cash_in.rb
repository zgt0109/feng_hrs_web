# == Schema Information
#
# Table name: cash_ins
#
#  id            :integer          not null, primary key
#  enterprise_id :integer
#  amount        :decimal(10, 2)
#  serial_outer  :string
#  serial_inner  :string
#  channel       :string
#  state         :string
#  note          :string
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_cash_ins_on_enterprise_id  (enterprise_id)
#

class CashIn < ActiveRecord::Base
  include AASM
  belongs_to :enterprise

  attr_accessor :enterprisename

  before_validation :set_enterprise, on: [:create, :update], unless: "enterprisename.nil?"
  validates_presence_of :enterprisename, on: [:create, :update], unless: "enterprisename.nil?"
  validates_presence_of :enterprise, message: '不存在', unless: "enterprisename.blank?"
  validates_presence_of :amount, :serial_inner, :serial_outer, :channel, :state
  validates :amount, numericality: true, allow_blank: true
  validates_uniqueness_of :serial_inner, :serial_outer, allow_blank: true

  aasm column: :state do
    state :pending, :initial => true
    state :confirmed
    state :rejected

    event :confirm do
      transitions from: :pending, to: :confirmed do
        after do
          self.enterprise.increment!(:balance, self.amount)
        end
      end
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end

    event :pend do
      transitions from: :rejected, to: :pending
    end
  end

  default_scope { order(updated_at: 'desc') }
  scope :get_cash_ins_by_state,
    -> (state) { state.blank? ? self.includes(:enterprise) : self.includes(:enterprise).send(state) }

  private
    def set_enterprise
      self.enterprise = Enterprise.where(name: self.enterprisename).take
    end
end
