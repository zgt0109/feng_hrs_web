//= require jquery
//= require jquery_ujs
//= require semantic-ui/dist/semantic
//= require_directory ./plugins
//= require 'china_city/jquery.china_city'


// semantic-ui
$(function(){
  // 下拉菜单
  $('.ui.dropdown').dropdown({
    on: 'hover'
  });

  // 功能菜单
  $('.ui.sidebar').sidebar({
    context: $('.bottom.segment')
  }).sidebar('attach events', '#tools .item:eq(1)');

  // 全选
  $(':checkbox[name=selectAll]').on('change', function() {
    $(':checkbox[name=singular_check]').prop('checked', this.checked);
  })

  // 提示信息
  $('.popmessage').popup();

  // 重新定义 modal 中返回按钮的作用
  $('.ui.modal').delegate('.ui.negative.button', 'click', function(){
    $('.ui.modal').modal('hide');
    event.preventDefault();
  })

})
