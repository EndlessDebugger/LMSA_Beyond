class Referral < ApplicationRecord
  validates :old_member, presence: true
  validates :email, presence: true
  validates :guest_first_name, presence: true
  validates :guest_last_name, presence: true

  def approved
    if !medical_prof?
      "N/A"
    elsif !admin_approved.present?
      "Pending"
    elsif admin_approved?
      "Approved"
    else
      "Rejected"
    end
    
  end
end
