module PlanHelper
  def repeat_term_options
    result = ""
    (1..12).each do |val|
      result += "<option value='#{val}'>#{val}</option>"      
    end
    return result.html_safe
  end
  def recurrence_repeat_term_options(recurrence)
    result = ""
    (1..12).each do |val|
      result += "<option value='#{val}' #{(val == recurrence.repeat_term) ? 'selected' : ''}>#{val}</option>"      
    end
    return result.html_safe
  end
end
