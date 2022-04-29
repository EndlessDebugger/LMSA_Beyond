class Announcement < ApplicationRecord
  validates :name, presence: true
  # validates :Rich_Description, presence: true
  has_rich_text :Rich_Description
end
