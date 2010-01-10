class CreateStatusUpdates < ActiveRecord::Migration
  def self.up
    create_table :status_updates do |t|
      t.integer :rubyist_id
      t.int8 :twitter_id
      t.text :original_text
      t.text :translated_text

      t.timestamps
    end
  end

  def self.down
    drop_table :status_updates
  end
end
