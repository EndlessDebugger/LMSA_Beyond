class AddActiveMemToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :active_mem, :boolean, default: false
  end
end
