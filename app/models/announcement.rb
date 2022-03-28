class Announcement < ApplicationRecord
    validates :name, presence: true
    validates :desc, presence: true
    validates :time, presence: true
end
