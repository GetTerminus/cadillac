result = []
@events.each do |event|
  result << {:id => "event_" + event.id.to_s + "_" + event.start_at.strftime("%Y-%m-%d"), 
          :title => event.recurrence.nil? ? event.display_name : event.recurrence.event_count.to_s + ' ' + (event.recurrence.event_count > 1 ? event.plural_name : event.display_name), 
    :description => event.description, 
          :start => event.start_at.strftime("%Y-%m-%d 00:00:00"), 
            :end => event.end_at.strftime("%Y-%m-%d 00:00:00"), 
            :url => calendar_edit_url(:event_id => event[:id], :date => event.start_at.strftime("%Y-%m-%d"), :format => :js), 
      :className => ['event', event.class.name.underscore]}
end
@recurrence_events.each do |event|
  result << {:id => "event_" + event[:id].to_s + "_" + event[:start_date].strftime("%Y-%m-%d"), 
          :title => event[:event_count].to_s + ' ' + (event[:event_count].to_i > 1 ? (Object.const_get event[:event_class_name]).plural_name : (Object.const_get event[:event_class_name]).display_name), 
    :description => '', 
          :start => event[:start_date].strftime("%Y-%m-%d 12:00:00"), 
            :end => event[:end_date].strftime("%Y-%m-%d 12:00:00"), 
            :url => calendar_new_url(:recurrence_id => event[:id], :date => event[:start_date], :format => :js), 
      :className => [event[:event_class_name].underscore, (event[:start_date] < Date.today ? 'missed-recurrence' : 'recurrence')]}
end
return result.to_json