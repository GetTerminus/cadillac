class DayOfMonth < Recurrence
  
  def calendar_events(start_date, end_date)
    @events = []
    day_of_month = nil
    week_day = nil
    month_week = nil
    schedule_element = JSON.parse(self.schedule).first
    if schedule_element.kind_of?(Array)
      week_day = schedule_element[0]
      month_week = schedule_element[1]
    else
      day_of_month = schedule_element
    end
    date = self.start_at
    while date <= end_date
      if date >= start_date
        #TODO: should day of month that is > than max day in current month be skipped?
        if !day_of_month.nil? && day_of_month == date.mday
          @events << {:id => self.id, :start_date => date, :end_date => date, :event_class_name => self.event_class_name, :event_count => self.event_count}
        end
        if !week_day.nil? && week_day == date.wday && month_week == date.week_of_month
          @events << {:id => self.id, :start_date => date, :end_date => date, :event_class_name => self.event_class_name, :event_count => self.event_count}
        end
      end
      if self.repeat_term > 1 && date.day == date.end_of_month.day
        date = date + (self.repeat_term - 1).months
      end
      date = date + 1.day
    end
    return @events
  end
  
  def description 
    result = self.event_count.to_s + " " + (self.event_count > 1 ? (Object.const_get self.event_class_name).plural_name : (Object.const_get self.event_class_name).display_name) + " on "
    schedule_element = JSON.parse(self.schedule).first
    if schedule_element.kind_of?(Array)
      result += "the #{month_week_name(schedule_element[1])} #{day_of_week_name(schedule_element[0])}"
    else
      result += "Day #{schedule_element}"
    end
    return result
  end
  
  def month_week_name(month_week)
    if 5 == month_week
      return "5th"
    elsif 4 == month_week
      return "4th"
    elsif 3 == month_week
      return "3rd"
    elsif 2 == month_week
      return "2nd"
    else
      return "1st"
    end
  end

end