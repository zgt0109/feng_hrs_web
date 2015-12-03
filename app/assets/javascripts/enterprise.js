// semantic-ui
$(function(){
  $('.ui.dropdown').dropdown({
    on: 'hover'
  });

  $('.ui.sidebar').sidebar({
    context: $('.bottom.segment')
  }).sidebar('attach events', '#tools .item:eq(1)');

  // check all
  $(':checkbox[name=selectAll]').on('change', function() {
    $(':checkbox[name=singular_check]').prop('checked', this.checked);
  })

  // popup
  $('.popmessage').popup();

  //job advanced
  $('#job_advance').attr('disabled', !this.checked);
  $(':checkbox[name=isAdvance]').change(function() {
    $('#job_advance').attr('disabled', !this.checked);
  })


  // 重新定义 modal 中返回按钮的作用
  $('.ui.modal').delegate('.ui.negative.button', 'click', function(){
    $('.ui.modal').modal('hide');
    event.preventDefault();
  })



})
