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
