class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.integer :referrals, :default => 1
      t.integer :prof_referrals, :default => 4
      t.integer :gen_event, :default => 4
      t.integer :fund_event, :default => 3
      t.string :vol_event, :default => 3

      t.timestamps
    end
  end
end
