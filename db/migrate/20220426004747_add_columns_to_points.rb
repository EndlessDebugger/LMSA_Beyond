class AddColumnsToPoints < ActiveRecord::Migration[6.1]
  def change
    add_column :points, :name, :string
    add_column :points, :point_type, :string
    add_column :points, :val, :integer
  end
end
