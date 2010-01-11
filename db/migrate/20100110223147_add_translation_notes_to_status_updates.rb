class AddTranslationNotesToStatusUpdates < ActiveRecord::Migration
  def self.up
    add_column :status_updates, :translation_notes, :text
  end

  def self.down
    remove_column :status_updates, :translation_notes
  end
end
