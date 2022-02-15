class CreatePoinEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :poin_events do |t|
      t.integer :user_id
      t.integer :balance
      t.datetime :date
      t.string :description
      t.integer :admin_award_id
      t.float :hours_attend

      t.timestamps
    end
  end
end
