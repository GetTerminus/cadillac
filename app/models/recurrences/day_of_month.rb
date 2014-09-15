class DayOfMonth < Recurrence
  
  def calendar_events(start_date, end_date)
    @events = []
    days_of_month = JSON.parse(self.schedule)
    date = start_date
    while date <= end_date
      if days_of_month.include?(date.mday)
        @events << {:id => self.id, :start_date => date, :end_date => date, :event_class_name => self.event_class_name, :event_count => self.event_count}
      end
      date = date + 1.day
    end
    return @events
  end
  
  def description 
    days_of_month = JSON.parse(self.schedule)
    self.event_count.to_s + " " + (self.event_count > 1 ? (Object.const_get self.event_class_name).plural_name : (Object.const_get self.event_class_name).display_name) + " on " + (days_of_month.count > 1 ? "Days #{days_of_month.to_s}" : "Day #{days_of_month[0]}")
  end
  
end