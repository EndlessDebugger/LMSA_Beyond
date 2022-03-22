class CreateCatergoriesEvent < ActiveRecord::Migration[6.1]
  def change
    create_table :catergories_events do |t|
      t.references :category, index: true, foregin_key: true
      t.references :event, index: true, foregin_key: true

      t.timestamps
    end
  end
end
