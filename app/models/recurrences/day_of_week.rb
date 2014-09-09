class DayOfWeek < Recurrence
  
  def calendar_events(start_date, end_date)
    @events = []
    days_of_week = JSON.parse(self.schedule)
    date = start_date
    while date <= end_date
      if date >= start_at && days_of_week.include?(date.wday)
        @events << {:id => self.id, :start_date => date, :end_date => date, :event_class_name => self.event_class_name}
      end
      date = date + 1.day
    end
    return @events
  end
  
end