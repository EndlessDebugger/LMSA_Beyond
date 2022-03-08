class EventHist < ApplicationRecord
  validates :event_id, presence: true
  validates :user_id, presence: true
  validates :sign_in, presence: true
  validates :point_recv, presence: true
end
