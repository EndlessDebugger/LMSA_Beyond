class DropHelpsTable < ActiveRecord::Migration[6.1]
  def change
      drop_table :helps
  end
end
