class DayOfMonth < Recurrence
  
  def calendar_events(start_date, end_date)
    @events = []
    days_of_month = JSON.parse(self.schedule)
    date = start_date
    while date <= end_date
      if days_of_month.include?(date.mday)
        @events << {:id => self.id, :start_date => date, :end_date => date, :event_class_name => self.event_class_name}
      end
      date = date + 1.day
    end
    return @events
  end
  
end