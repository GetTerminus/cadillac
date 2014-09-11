class AddAccountUserToRecurrence < ActiveRecord::Migration
  def change
    add_column :recurrences, :account_id, :integer
    add_column :recurrences, :assignee_id, :integer
  end
end
