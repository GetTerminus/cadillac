function loadNewEventPopup(date) {
  $('.edit-popup').hide();
  $('.edit-popup').empty();
  $.ajax({
      url: "/calendar/new_event?date=" + date.format(),
      context: document.body,
      success: function(responseText) {
          eval(responseText);
      }
  });
}

$(document).ready(function() {

    $('#calendar').fullCalendar({
        events: '/data.json',
        eventRender: function(event, element) {
            $('#edit-container').append("<div id='" + event.id + "' class='edit-popup'></div>");
        },
        eventClick: function(event) {
            $('.edit-popup').hide();
            $('.edit-popup').empty();
            if (event.url) {
                $.ajax({
                    url: event.url,
                    context: document.body,
                    success: function(responseText) {
                        eval(responseText);
                    }
                });
                return false;
            }
        },
        eventAfterAllRender: function(view) {
          $('#calendar_container').css('height', view.height + 600); 
        },
        dayRender: function(date, cell) {
          $('#edit-container').append("<div id='new_" + date.format() + "' class='edit-popup'></div>");
        }
      /*
        ,dayClick: function(date, allDay, jsEvent, view) {
          if (allDay) {
            loadNewEventPopup(date);
          }
        }
      */
    });

});
