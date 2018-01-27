//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: https://coffeescript.org/
document.addEventListener("turbolinks:load",function() {
  $('#expertise').click(function() {
    $('#description').css("display","inline-block")
    $('#two').css("display","none")
    });

    $('#description').click(function() {
      $('#career').css("display","inline-block")
      $('#three').css("display","none")
    });

    $('#career').click(function() {
      $('#user_info').css("display", "block")
      $('#four').css("display","none")
    });

    $('#user_info').click(function() {
      $('#submit').css("display", "block")
      $('#submit').scrollTop();
    });

    if ($("input:checked")){
      $('.experience_button').click(function() {
        if (!$('#beginner').hasClass('selected') && !$('#expert').hasClass('selected')) {
        $(this).toggleClass("selected")
      } else if (!$(this).hasClass('selected')) {
        $('#beginner').toggleClass("selected")
        $('#expert').toggleClass("selected")
      }
      });
    } else {
      $('.experience_button').click(function() {
        $(this).removeClass("selected")
      });
    }

  });
