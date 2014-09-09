result = []
@events.each do |event|
  result << {:id => event.id, :title => event.title, :description => event.description, :start => event.start_at, :end => event.end_at, :url => event_url(event, format: :html), :className => ['event', event.class.name.underscore]}
end
@recurrence_events.each do |event|
  result << {:id => event[:id], :title => '', :description => '', :start => event[:start_date], :end => event[:end_date], :url => 'http://google.com', :className => ['recurrence', event[:event_class_name].underscore]}
end
return result.to_json