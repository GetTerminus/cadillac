class Event < ActiveRecord::Base
  belongs_to :recurrence
  belongs_to :account
  belongs_to :user, :foreign_key => :owner_id
end
