class TimeEntryBelongsToUser < ActiveRecord::Migration
  def self.up
    change_table :time_entries do |t|
      t.integer :user_id
    end
  end

  def self.down
    change_table :time_entries do |t|
      t.remove :user_id
    end
  end
end
