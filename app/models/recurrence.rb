class Recurrence < ActiveRecord::Base
  belongs_to :account
  belongs_to :user, :foreign_key => :assignee_id
  
  def calendar_events(start_date, end_date)  
  end
  
  def description 
  end
  
  def day_of_week_name(day_of_week)
    ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"][day_of_week]
  end
    
  def short_day_of_week_name(day_of_week)
    ["Su","M","Tu","W","Th","F","Sa"][day_of_week]
  end
  
  def day_of_week_scheduled(day_of_week)
    return false
  end
end
