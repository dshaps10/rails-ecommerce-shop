// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $(".order-form").on("ajax:success", function(event, response) {
    $("nav").after(response);
    $(".order-form").after('<font color="green">Order added to cart!</font>');
  });
});
