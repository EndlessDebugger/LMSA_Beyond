class RemoveVirtualFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :virtual
    add_column :users, :virtual, :boolean, :default => false
  end
end
