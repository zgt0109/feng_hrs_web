//= require jquery
//= require jquery_ujs
//= require semantic-ui/dist/semantic
//= require_directory ./plugins
//= require 'china_city/jquery.china_city'

// semantic-ui
$(function(){
  $('.ui.dropdown').dropdown({
    on: 'hover'
  });

  $('.ui.sidebar').sidebar({
    context: $('.bottom.segment')
  }).sidebar('attach events', '#tools .item:eq(1)');

  $(':checkbox[name=selectAll]').on('change', function() {
    $(':checkbox[name=singular_check]').prop('checked', this.checked);
  })

})
