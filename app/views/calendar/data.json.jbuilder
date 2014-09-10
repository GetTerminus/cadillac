result = []
@events.each do |event|
  result << {:id => event.id, 
          :title => event.title, 
    :description => event.description, 
          :start => event.start_at.strftime("%Y-%m-%d 00:00:00"), 
            :end => event.end_at.strftime("%Y-%m-%d 00:00:00"), 
            :url => event_url(event, :format => :html), 
      :className => ['event', event.class.name.underscore]}
end
@recurrence_events.each do |event|
  result << {:id => event[:id], 
          :title => '', 
    :description => '', 
          :start => event[:start_date].strftime("%Y-%m-%d 12:00:00"), 
            :end => event[:end_date].strftime("%Y-%m-%d 12:00:00"), 
            :url => new_event_url(:recurrence => event[:id], :date => event[:start_date], :format => :html), 
      :className => ['recurrence', event[:event_class_name].underscore]}
end
return result.to_json