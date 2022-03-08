class PoinEvent < ApplicationRecord
  has_one :user
  has_one :event
  validates :user_id, presence: true
  validates :balance, presence: true
  validates :admin_award_id, presence: true
end
