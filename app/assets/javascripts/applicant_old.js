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

  // 注册页面同意按钮
  $('.agreement').change(function() {
    bool = $(this).prop('checked');

    color = bool ? 'orange' : 'grey';
    $('.btn-warning.btn-lg').prop('disabled', !bool).css('background-color', color);
  })
})
