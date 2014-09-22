function editRecurrence(recurrence_id) {
  $('.edit-popup').hide();
  $('.edit-popup').empty();
  $.ajax({
      url: "/plan/edit?recurrence_id=" + recurrence_id,
      context: document.body,
      success: function(responseText) {
          eval(responseText);
      }
  }); 
}
function newRecurrence() {
  $('.edit-popup').hide();
  $('.edit-popup').empty();
  $.ajax({
      url: "/plan/new",
      context: document.body,
      success: function(responseText) {
          eval(responseText);
      }
  }); 
}
;
