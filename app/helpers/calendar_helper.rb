module CalendarHelper
  def event_options
    result = ""
    result += "<option value='#{Tweet.to_s}'>#{Tweet.display_name}</option>"      
    result += "<option value='#{BlogPost.to_s}'>#{BlogPost.display_name}</option>"
    result += "<option value='#{FacebookPost.to_s}'>#{FacebookPost.display_name}</option>"
    result += "<option value='#{LinkedinPost.to_s}'>#{LinkedinPost.display_name}</option>"
    result += "<option value='#{GplusPost.to_s}'>#{GplusPost.display_name}</option>"
    result += "<option value='#{PressRelease.to_s}'>#{PressRelease.display_name}</option>"
    result += "<option value='#{WhitePaper.to_s}'>#{WhitePaper.display_name}</option>"
    result += "<option value='#{Infographic.to_s}'>#{Infographic.display_name}</option>"
    result += "<option value='#{Ebook.to_s}'>#{Ebook.display_name}</option>"
    result += "<option value='#{Webinar.to_s}'>#{Webinar.display_name}</option>"
    result += "<option value='#{Video.to_s}'>#{Video.display_name}</option>"
    result += "<option value='#{GuestPost.to_s}'>#{GuestPost.display_name}</option>"
    result += "<option value='#{Generic.to_s}'>#{Generic.display_name}</option>"
    return result.html_safe
  end
  def recurrence_event_options(recurrence)
    result = ""
    result += "<option value='#{Tweet.to_s}' #{Tweet.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{Tweet.display_name}</option>"      
    result += "<option value='#{BlogPost.to_s}' #{BlogPost.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{BlogPost.display_name}</option>"
    result += "<option value='#{FacebookPost.to_s}' #{FacebookPost.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{FacebookPost.display_name}</option>"
    result += "<option value='#{LinkedinPost.to_s}' #{LinkedinPost.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{LinkedinPost.display_name}</option>"
    result += "<option value='#{GplusPost.to_s}' #{GplusPost.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{GplusPost.display_name}</option>"
    result += "<option value='#{PressRelease.to_s}' #{PressRelease.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{PressRelease.display_name}</option>"
    result += "<option value='#{WhitePaper.to_s}' #{WhitePaper.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{WhitePaper.display_name}</option>"
    result += "<option value='#{Infographic.to_s}' #{Infographic.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{Infographic.display_name}</option>"
    result += "<option value='#{Ebook.to_s}' #{Ebook.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{Ebook.display_name}</option>"
    result += "<option value='#{Webinar.to_s}' #{Webinar.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{Webinar.display_name}</option>"
    result += "<option value='#{Video.to_s}' #{Video.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{Video.display_name}</option>"
    result += "<option value='#{GuestPost.to_s}' #{GuestPost.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{GuestPost.display_name}</option>"
    result += "<option value='#{Generic.to_s}' #{Generic.to_s.eql?(recurrence.event_class_name) ? 'selected' : ''}>#{Generic.display_name}</option>"
    return result.html_safe
  end
end
