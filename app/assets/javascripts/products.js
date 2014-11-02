// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
$(document).on('page:load ready', function() {
  new AnimOnScroll( document.getElementById('grid'), {
    minDuration : 0.4,
    maxDuration : 0.7,
    viewportFactor : 0.2
  } );
});
