class AddEventCountToRecurrence < ActiveRecord::Migration
  def change
    add_column :recurrences, :event_count, :integer, :null => false, :default => 1
  end
end
