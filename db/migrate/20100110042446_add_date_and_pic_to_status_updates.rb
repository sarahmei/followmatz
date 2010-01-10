class AddDateAndPicToStatusUpdates < ActiveRecord::Migration
  def self.up
    add_column :status_updates, :twitter_date, :datetime
    add_column :status_updates, :pic_url, :string
  end

  def self.down
    remove_column :status_updates, :twitter_date
    remove_column :status_updates, :pic_url
  end
end
