class CalendarController < ApplicationController
  before_action :authenticate_user!
  
  def main
    if !current_user.account.initialized
      redirect_to setup_path
    end
  end
  
  # GET /events.json
  def data
    start_date = params["start"]
    end_date = params["end"]
    @events = Event.where(:account_id => current_user.account_id).where("start_at >= ? AND end_at <= ?", Date.parse(start_date), Date.parse(end_date))
    @recurrence_events = []
    @recurrences = Recurrence.where(:account_id => current_user.account_id).where("start_at <= ?", Date.parse(end_date))
    @recurrences.each do |recurrence|
      new_recurrence_events = recurrence.calendar_events(Date.parse(start_date), Date.parse(end_date))
      @recurrence_events = @recurrence_events | new_recurrence_events.reject{ |r| !@events.select{ |e| e.recurrence_id == r[:id] && e.start_at == r[:start_date] }.empty? }
    end
  end
  
  def new
    @recurrence = Recurrence.find(params[:recurrence_id])
    @date = params[:date]
    @container = "event_#{@recurrence.id}_#{@date}"
    respond_to do |format|
      format.js
    end
  end
  
  def create
    recurrence = Recurrence.find(params[:recurrence_id])
    if !recurrence.nil?
      @event = (Object.const_get recurrence.event_class_name).new
      @event.recurrence_id = recurrence.id
      date = Date.parse(params[:date])
      @event.start_at = date
      @event.end_at = date
      @event.account_id = current_user.account_id
      @event.owner_id = current_user.id
      @event.title = params[:title]
      @event.description = params[:description]
      @event.publish_url = params[:publish_url]
      @event.save
      #TODO: to correct month
      redirect_to root_path
    end
  end
  
  def edit
    @event = Event.find(params[:event_id])
    @date = params[:date]
    @container = "event_#{@event.id}_#{@date}"
    respond_to do |format|
      format.js
    end
  end
  
  def update
    @event = Event.find(params[:event_id])
    date = Date.civil(params[:date][:"part(1i)"].to_i,params[:date][:"part(2i)"].to_i,params[:date][:"part(3i)"].to_i) 
    @event.start_at = date
    @event.end_at = date
    @event.title = params[:title]
    @event.description = params[:description]
    @event.publish_url = params[:publish_url]
    @event.save
    #TODO: to correct month
    redirect_to root_path
  end
end
