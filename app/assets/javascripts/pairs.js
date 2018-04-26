/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: https://coffeescript.org/
*/

document.addEventListener("turbolinks:load",function() {
  $('.resume').hide()
  $('.more').click(function() {
    $(this).next().slideToggle("slow")
  });
});
