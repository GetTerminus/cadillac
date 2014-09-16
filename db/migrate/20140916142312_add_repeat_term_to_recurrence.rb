class AddRepeatTermToRecurrence < ActiveRecord::Migration
  def change
    add_column :recurrences, :repeat_term, :integer, :null => false, :default => 1
  end
end
