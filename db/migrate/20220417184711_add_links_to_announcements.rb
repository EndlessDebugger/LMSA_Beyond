class AddLinksToAnnouncements < ActiveRecord::Migration[6.1]
  def change
    add_column :announcements, :link, :string
  end
end
