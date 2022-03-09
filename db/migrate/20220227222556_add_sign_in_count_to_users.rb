class AddSignInCountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :signInCount, :integer, default: 0
  end
end
