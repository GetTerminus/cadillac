class CalendarController < ApplicationController
  def main

  end
  
  # GET /events.json
  def data
    start_date = params["start"]
    end_date = params["end"]
    @events = Event.where("start_at >= ? AND end_at <= ?", Date.parse(start_date), Date.parse(end_date))
    @recurrence_events = []
    @recurrences = Recurrence.where("start_at <= ?", Date.parse(end_date))
    @recurrences.each do |recurrence|
      @recurrence_events = @recurrence_events | recurrence.calendar_events(Date.parse(start_date), Date.parse(end_date))
    end
  end
end
