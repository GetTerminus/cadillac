class CreateContentDetails < ActiveRecord::Migration
  def change
    create_table :content_details do |t|
      t.string :publish_url
      t.text :description
      t.boolean :is_educational
      t.boolean :is_promotional
      t.boolean :is_conversational
      t.integer :related_content_id
      t.integer :owner_id
      
      t.timestamps
    end
  end
end
