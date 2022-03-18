class EventsRemoveEventDate < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :event_date
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
  end
end
