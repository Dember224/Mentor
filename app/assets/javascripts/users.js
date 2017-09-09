//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener("turbolinks:load",function() {
  $('#identity').click(function() {
    $('#expertise').css("display","inline-block")
    $('#two').css("display","none")
    });

    $('#expertise').click(function() {
      $('#description').css("display","inline-block")
      $('#three').css("display","none")
    });

    $('#description').click(function() {
      $('#career').css("display", "block")
      $('#four').css("display","none")
    });

    $('#career').click(function() {
      $('#submit').css("display", "block")
      $('#submit').scrollTop();
    });
  });
