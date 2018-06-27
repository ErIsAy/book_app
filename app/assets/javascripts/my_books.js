// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// AJAX delete
$(document).ready(function() {
  if ($('body.dashboard.index').length == 0) {
    return;
  }
  $('.delete-my-book').click(function(e){
    e.preventDefault();
    let deletionUrl = e.target.getAttribute('href');
    $.ajax({
      method: 'DELETE',
      url: deletionUrl,
      success: function(data) {
        $(e.target).parents('.my-book-div').remove();
        toastr.success('Book has been successfully deleted.');
      }
    })
  });

});