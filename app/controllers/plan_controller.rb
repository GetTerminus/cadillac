class PlanController < ApplicationController
  
  WEEKDAYS = {:sunday => 0, :monday => 1, :tuesday => 2, :wednesday => 3, :thursday => 4, :friday => 5, :saturday => 6}
  
  def new
    @container = "new_recurrence"
    respond_to do |format|
      format.js
    end
  end
  
  def create
    recurrence_type = params[:recurrence_type]
    if !recurrence_type.blank?
      recurrence = (Object.const_get recurrence_type).new
      recurrence.account_id = current_user.account_id
      recurrence.start_at = Date.today
      schedule = []
      if recurrence_type.eql?(DayOfMonth.to_s) && !params[:month_day].blank?
        schedule << params[:month_day].to_i
      else
        WEEKDAYS.each do |name, num|
          if "1".eql?(params[name])
            schedule << num
          end
        end
      end
      recurrence.schedule = schedule.to_json
      recurrence.event_count = params[:event_count]
      recurrence.event_class_name = params[:event_type]
      recurrence.instructions = params[:instructions]
      recurrence.save
    end
    redirect_to root_path
  end
  
  def edit
    @recurrence = Recurrence.find(params[:recurrence_id])
    @container = "recurrence_#{@recurrence.id}"
    respond_to do |format|
      format.js
    end
  end
  
  def update
    recurrence = Recurrence.find(params[:recurrence_id])
    if !recurrence.nil?
      if !params[:recurrence_type].blank?
        recurrence.type = params[:recurrence_type]
      end
      recurrence.event_class_name = params[:type]
      recurrence.instructions = params[:instructions]
      recurrence.save
    end
    redirect_to root_path
  end
  
  def remove
    recurrence = Recurrence.find(params[:recurrence_id])
    if !recurrence.nil?
      recurrence.delete
    end
    redirect_to root_path
  end
end
