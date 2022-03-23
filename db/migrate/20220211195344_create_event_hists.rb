class CreateEventHists < ActiveRecord::Migration[6.1]
  def change
    create_table :event_hists do |t|
      t.string :event_id
      t.integer :user_id
      t.boolean :sign_in
      t.integer :point_recv

      t.timestamps
    end
  end
end
