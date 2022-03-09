class Referral < ApplicationRecord
  validates :old_member, presence: true
  validates :email, presence: true
end
