class AddPublishUrlToEvent < ActiveRecord::Migration
  def change
    add_column :events, :publish_url, :string
  end
end
