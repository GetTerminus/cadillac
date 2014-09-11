class Recurrence < ActiveRecord::Base
  belongs_to :account
  belongs_to :user, :foreign_key => :assignee_id
  
  def calendar_events(start_date, end_date)  
  end
  
end
