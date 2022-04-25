class Referral < ApplicationRecord
  validates :old_member, presence: true
  validates :email, presence: true
  validates :guest_first_name, presence: true
  validates :guest_last_name, presence: true

  def approved
    if !medical_prof
      'N/A'
    elsif admin_approved.nil?
      'Pending'
    elsif !admin_approved
      'Rejected'
    else
      'Approved'
    end
  end

  def prof
    if medical_prof
      "Yes"
    else
      "No"
    end
  end

end
