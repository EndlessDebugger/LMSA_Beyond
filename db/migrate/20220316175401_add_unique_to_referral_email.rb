class AddUniqueToReferralEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :referrals, :email, unique: true
  end
end
