// semantic-ui
$(function(){
  $('.ui.dropdown').dropdown({
    on: 'hover'
  });

  $('.ui.sidebar').sidebar({
    context: $('.bottom.segment')
  }).sidebar('attach events', '#tools .item:eq(1)');

})
