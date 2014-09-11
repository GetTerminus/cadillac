class AddInitializedToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :initialized, :boolean
  end
end
