class AddActiveMemToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :active_mem, :boolean, default: false
  end
end
