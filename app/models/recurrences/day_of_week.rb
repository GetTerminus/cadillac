class DayOfWeek < Recurrence
  
  def calendar_events(start_date, end_date)
    @events = []
    days_of_week = JSON.parse(self.schedule)
    date = start_date
    while date <= end_date
      if date >= start_at && days_of_week.include?(date.wday)
        @events << {:id => self.id, :start_date => date, :end_date => date, :event_class_name => self.event_class_name, :event_count => self.event_count}
      end
      if self.repeat_term > 1 && date.wday == 6
        date = date + ((self.repeat_term - 1) * 7).days
      end
      date = date + 1.day
    end
    return @events
  end
  
  def description 
    self.event_count.to_s + " " + (self.event_count > 1 ? (Object.const_get self.event_class_name).plural_name : (Object.const_get self.event_class_name).display_name) + " " + short_days_string
  end
  
  private
  
  def short_days_string
    result = "["
    days_of_week = JSON.parse(self.schedule)
    days_of_week.each_with_index do |day_of_week, index|
      if index > 0
        result += ","
      end
      result += short_day_of_week_name(day_of_week)
    end
    result += "]"
  end
    
  def day_of_week_name(day_of_week)
    ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"][day_of_week]
  end
    
  def short_day_of_week_name(day_of_week)
    ["Su","M","Tu","W","Th","F","Sa"][day_of_week]
  end
  
end