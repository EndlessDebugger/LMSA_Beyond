class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.integer :referrals
      t.integer :prof_referrals
      t.integer :gen_event
      t.integer :fund_event
      t.string :vol_event

      t.timestamps
    end
  end
end
