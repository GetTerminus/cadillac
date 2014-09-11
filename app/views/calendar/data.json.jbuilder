result = []
@events.each do |event|
  result << {:id => "event_" + event.id.to_s + "_" + event.start_at.strftime("%Y-%m-%d"), 
          :title => event.title, 
    :description => event.description, 
          :start => event.start_at.strftime("%Y-%m-%d 00:00:00"), 
            :end => event.end_at.strftime("%Y-%m-%d 00:00:00"), 
            :url => calendar_edit_url(:event_id => event[:id], :date => event.start_at.strftime("%Y-%m-%d"), :format => :js), 
      :className => ['event', event.class.name.underscore]}
end
@recurrence_events.each do |event|
  result << {:id => "event_" + event[:id].to_s + "_" + event[:start_date].strftime("%Y-%m-%d"), 
          :title => '', 
    :description => '', 
          :start => event[:start_date].strftime("%Y-%m-%d 12:00:00"), 
            :end => event[:end_date].strftime("%Y-%m-%d 12:00:00"), 
            :url => calendar_new_url(:recurrence_id => event[:id], :date => event[:start_date], :format => :js), 
      :className => ['recurrence', event[:event_class_name].underscore]}
end
return result.to_json