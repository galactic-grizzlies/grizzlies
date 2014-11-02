// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
$(document).on('page:load ready', function() {
  var $addTooShoppingCartModal = $('.js-add-too-shopping-cart-modal');
  $addTooShoppingCartModal.on('click', '.js-close-modal', function() {
    $addTooShoppingCartModal.hide();
    return false;
  });
});
