class RemoveEventIdFromEventHists < ActiveRecord::Migration[6.1]
  def change
    remove_column :event_hists, :event_id
    add_reference :event_hists, :event, foreign_key: true, type: :uuid
  end
end
