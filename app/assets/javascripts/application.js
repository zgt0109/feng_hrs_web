//= require jquery
//= require jquery_ujs
//= require semantic-ui/dist/semantic
//= require_directory ./plugins
//= require 'china_city/jquery.china_city'

//= require simple-module/lib/module.js
//= require simple-hotkeys/lib/hotkeys.js
//= require simple-uploader/lib/uploader.js
//= require simditor/lib/simditor.js


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
    $(':checkbox[name=singular_check][disabled!=disabled]').prop('checked', this.checked);
  })

  // 提示信息
  $('.popmessage').popup();

  // 重新定义 modal 中返回按钮的作用
  $('.ui.modal').delegate('.ui.negative.button', 'click', function(){
    $('.ui.modal').modal('hide');
    event.preventDefault();
  })

  // 编辑器
  // var editor = new Simditor({
  //   textarea: $('#editor')
  //   //optional options
  // });

})
