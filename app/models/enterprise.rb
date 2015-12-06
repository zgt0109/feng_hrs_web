# == Schema Information
#
# Table name: enterprises
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  mobile                 :string
#
# Indexes
#
#  index_enterprises_on_confirmation_token    (confirmation_token) UNIQUE
#  index_enterprises_on_email                 (email) UNIQUE
#  index_enterprises_on_reset_password_token  (reset_password_token) UNIQUE
#  index_enterprises_on_unlock_token          (unlock_token) UNIQUE
#

class Enterprise < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable

  attr_accessor :account, :email_signup, :mobile_signup

  MOBILE_REGEX = /\A1[3|4|5|7|8][0-9]{9}\Z/

  default_scope { order('created_at desc') }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable,
         authentication_keys: [:account]


  validates :name, length: { minimum: 2, maximum: 20 }, presence: true

  has_many :labors
  has_many :companies
  has_many :contacts
  has_many :jobs
  has_one  :debit
  has_many :zhao, class_name: 'Appointment', foreign_key: :zhao_id
  has_many :song, class_name: 'Appointment', foreign_key: :song_id

  has_many :zhao_labors, through: :zhao, source: :labor


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if account = conditions.delete(:account)
      where(conditions).where(["lower(mobile) = :value OR lower(email) = :value", { value: account.downcase }]).first
    else
      where(conditions).first
    end
  end
end
