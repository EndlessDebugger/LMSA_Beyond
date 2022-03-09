class Event < ApplicationRecord
  has_many :event_hists
  validates :event_id, presence: true
  validates :event_name, presence: true
  validates :event_date, presence: true
  validates :point_val, presence: true
end
