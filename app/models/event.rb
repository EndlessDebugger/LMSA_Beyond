class Event < ApplicationRecord
  has_many :event_hists
  validates :event_name, presence: true
  validates :event_date, presence: true
  validates :point_val, presence: true
  validates :total_event_hr, presence: true

  enum e_type: {
    other: 'Other',
    volunteer: 'Volunteering',
    familia: 'Familia Social',
    study: 'Study Social',
    general: 'General Meeting',
    fund: 'Fundraising'
  }, _prefix: true, _default: :other
end
