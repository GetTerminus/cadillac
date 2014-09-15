class AddInstructionsToRecurrence < ActiveRecord::Migration
  def change
    add_column :recurrences, :instructions, :string
  end
end
