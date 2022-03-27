class Event < ApplicationRecord
  has_many :event_hists
  has_and_belongs_to_many :categories
  validates :event_name, presence: true
  validates :event_date, presence: true
  validates :point_val, presence: true
  validates :total_event_hr, presence: true
end
