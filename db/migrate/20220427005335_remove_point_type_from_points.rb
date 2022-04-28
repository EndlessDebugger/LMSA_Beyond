class RemovePointTypeFromPoints < ActiveRecord::Migration[6.1]
  def change
    remove_column :points, :point_type
  end
end
