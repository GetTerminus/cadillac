class Event < ActiveRecord::Base
  belongs_to :recurrence
  belongs_to :account
  belongs_to :user, :foreign_key => :owner_id
  
  def display_name
    self.class.display_name
  end
  
  def self.display_name
    "Event"
  end
    
  def plural_name
    self.class.plural_name
  end
  
  def self.plural_name
    "Events"
  end
end
