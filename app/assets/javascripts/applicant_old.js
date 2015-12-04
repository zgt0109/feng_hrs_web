//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require slick-carousel/slick/slick.min
//= require applicant_old/home-hero-slides

$(function () {
  $('#myTab li').click(function() {
    $('#myTab li').removeClass('active');
    $(this).addClass('active');
  })
})
