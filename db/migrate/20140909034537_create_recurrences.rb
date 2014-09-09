class CreateRecurrences < ActiveRecord::Migration
  def change
    create_table :recurrences do |t|
      t.string :type
      t.string :event_class_name
      t.string :schedule
      t.datetime :start_at
      t.timestamps
    end
  end
end
