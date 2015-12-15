// 注册页面同意按钮
$('.agreement').change(function() {
  bool = $(this).prop('checked');

  color = bool ? 'orange' : 'grey';
  $('.regist').prop('disabled', !bool).css('background-color', color);
})
