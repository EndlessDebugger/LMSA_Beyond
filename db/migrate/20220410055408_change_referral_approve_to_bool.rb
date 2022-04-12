class ChangeReferralApproveToBool < ActiveRecord::Migration[6.1]
  def change

    remove_column :referrals, :admin_approved
    add_column :referrals, :admin_approved, :boolean
  end
end
