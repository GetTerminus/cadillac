class AddOwnerToEvent < ActiveRecord::Migration
  def change
    add_column :events, :account_id, :integer
    add_column :events, :owner_id, :integer
  end
end
