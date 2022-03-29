class AddTypeToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :e_type, :string, null: false
    remove_column :events, :event_type

    drop_table :categories do |t|
      t.string "name"
      t.string "desc"
      t.string "color"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

  end
end
