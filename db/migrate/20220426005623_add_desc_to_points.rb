class AddDescToPoints < ActiveRecord::Migration[6.1]
  def change
    add_column :points, :desc, :string
  end
end
