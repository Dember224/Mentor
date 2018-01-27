/*# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: https://coffeescript.org/
*/

document.addEventListener("turbolinks:load",function() {
  $('#more_majors').click(function() {
    $('#resume_second_undergrad_major').css("display", "inline")
    $('#more_majors').css("display","inline")
  });

  $('#first_minor').click(function() {
    $('#resume_first_undergrad_minor').css('display', 'inline')
    $('#first_minor').css('display', 'none')
    $('#second_minor').css('display', 'inline')
  });


  $('#second_minor').click(function() {
    $('#resume_second_undergrad_minor').css('display', 'inline')
    $('#second_minor').css('display', 'none')
    $('#third_minor').css('display', 'inline')
  });

  $('#third_minor').click(function() {
    $('#resume_third_undergrad_minor').css('display', 'inline')
    $('#third_minor').css('display', 'none')
  });

  $('#new_uni').click(function(){
    $('#second_university').css('display', 'inline')
    $('#new_uni').css('display', 'none')
  });

  $('#second_graduate').click(function() {
    $('#graduate_studies').css('display', 'inline')
    $('#second_graduate').css('display', 'none')
  });

  $('#hs').click(function(){
    $('#high_school').css('display', 'block')
    $('#title_high_school').css('display', 'inline')
    $('#hs').css('display', 'none')

  });

  $('#ug').click(function(){
    $('#undergrad').css('display', 'inline')
    $('#title_undergrad').css('display', 'inline')
    $('#ug').css('display', 'none')
  });

  $('#advanced').click(function(){
    $('#advanced_degree').css('display', 'inline')
    $('#title_advanced_degree').css('display', 'inline')
    $('#advanced').css('display', 'none')
  });

  $('#work').click(function(){
    $('#jobs').css('display', 'inline')
    $('#title_jobs').css('display', 'inline')
    $('#work').css('display', 'none')
  });

  $('#voluntary').click(function() {
    $('#volunteer').css('display', 'inline')
    $('#voluntary').css('display', 'none')
    $('#title_volunteer').css('display', 'inline')
  });

  $('#certified').click(function() {
    $('#certs').css('display', 'inline')
    $('#title_cert').css('display', 'inline')
    $('#certified').css('display', 'none')
  });

  $('#hobbies').click(function() {
    $('#hobby').css('display', 'inline')
    $('#hobbies').css('display', 'none')
    $('#title_hobby').css('display', 'inline')
  });



})
