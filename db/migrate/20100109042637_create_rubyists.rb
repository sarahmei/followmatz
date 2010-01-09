class CreateRubyists < ActiveRecord::Migration
  def self.up
    create_table :rubyists do |t|
      t.string :twitter_name

      t.timestamps
    end
  end

  def self.down
    drop_table :rubyists
  end
end
