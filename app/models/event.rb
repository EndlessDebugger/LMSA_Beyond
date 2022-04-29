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

  def driveImage
    if graphics.present? && graphics.include?('drive.google')
      'https://drive.google.com/uc?export=view&id=' + graphics[32..-18]
    else
      graphics
    end
  end
end
