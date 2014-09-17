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
      schedule = []
      if recurrence_type.eql?(DayOfMonth.to_s) && !params[:month_date].blank?
        date_val = params[:month_date].split(' ').length > 1 ? params[:month_date].split(' ')[1] : params[:month_date]
        start_date = Date.strptime(date_val, "%m/%d/%Y")
        if !"month_day".eql?(params[:repeats_by])
          schedule << [start_date.wday, start_date.week_of_month]
        else
          schedule << start_date.mday
        end
        recurrence.repeat_term = params[:repeats_months]
        recurrence.start_at = start_date
      else
        WEEKDAYS.each do |name, num|
          if "1".eql?(params[name])
            schedule << num
          end
        end
        recurrence.repeat_term = params[:repeats_weeks]
        recurrence.start_at = Date.today
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
      recurrence_type = params[:recurrence_type]
      if !recurrence_type.blank?
        recurrence.type = recurrence_type
        recurrence.account_id = current_user.account_id
        schedule = []
        if recurrence_type.eql?(DayOfMonth.to_s) && !params[:month_date].blank?
          date_val = params[:month_date].split(' ').length > 1 ? params[:month_date].split(' ')[1] : params[:month_date]
          start_date = Date.strptime(date_val, "%m/%d/%Y")
          if !"month_day".eql?(params[:repeats_by])
            schedule << [start_date.wday, start_date.week_of_month]
          else
            schedule << start_date.mday
          end
          recurrence.repeat_term = params[:repeats_months]
          recurrence.start_at = start_date
        else
          WEEKDAYS.each do |name, num|
            if "1".eql?(params[name])
              schedule << num
            end
          end
          recurrence.repeat_term = params[:repeats_weeks]
          recurrence.start_at = Date.today
        end
        recurrence.schedule = schedule.to_json
        recurrence.event_count = params[:event_count]
        recurrence.event_class_name = params[:event_type]
        recurrence.instructions = params[:instructions]
        recurrence.save
      end
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
