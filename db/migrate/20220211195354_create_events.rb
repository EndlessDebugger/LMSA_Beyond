class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :event_id
      t.string :event_name
      t.string :event_type
      t.datetime :event_date
      t.string :description
      t.integer :event_creator
      t.boolean :virtual
      t.string :password
      t.string :meeting_link
      t.datetime :signin_time
      t.integer :point_val
      t.string :graphics
      t.float :total_event_hr

      t.timestamps
    end
  end
end
