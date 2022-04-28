class AddPointEventIdToReferrals < ActiveRecord::Migration[6.1]
  def change
    add_reference :referrals, :poin_events, foreign_key: true
  end
end
