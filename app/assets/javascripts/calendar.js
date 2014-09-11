$(document).ready(function() {

    $('#calendar').fullCalendar({
        events: '/data.json',
        eventRender: function(event, element) {
            $('#edit-container').append("<div id='" + event.id + "' class='edit-popup'></div>");
        },
        eventClick: function(event) {
            $('.edit-popup').hide();
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
        }
    })

});