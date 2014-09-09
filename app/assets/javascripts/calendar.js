$(document).ready(function() {

    $('#calendar').fullCalendar({
        events: '/data.json'
    })

});