class CreateAnnouncements < ActiveRecord::Migration[6.1]
  def change
    create_table :announcements do |t|
      t.string :name
      t.integer :creator_id
      t.references :event_id
      t.string :desc

      t.timestamps
    end
  end
end
