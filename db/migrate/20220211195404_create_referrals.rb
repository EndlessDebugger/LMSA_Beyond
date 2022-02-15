class CreateReferrals < ActiveRecord::Migration[6.1]
  def change
    create_table :referrals do |t|
      t.integer :old_member
      t.integer :new_member
      t.string :guest_first_name
      t.string :guest_last_name
      t.boolean :medical_prof
      t.string :email
      t.datetime :date_referred
      t.string :admin_approved

      t.timestamps
    end
  end
end
