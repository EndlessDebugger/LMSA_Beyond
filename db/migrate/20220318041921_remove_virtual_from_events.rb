class RemoveVirtualFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :virtual
    add_column :events, :virtual, :boolean, :default => false
  end
end
