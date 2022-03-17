class RemoveEventIdFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :event_id
    add_column :helps, :title, :string
    add_column :helps, :creator_id, :integer
    add_column :helps, :desc, :string
    remove_column :users, :user_id
    remove_column :users, :password
    remove_column :users, :ismember
    remove_column :referrals, :new_member
  end
end
