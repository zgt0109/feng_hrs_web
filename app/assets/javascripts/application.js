//= require jquery
//= require jquery_ujs
//= require semantic-ui/dist/semantic
$(function(){
  $('.ui.dropdown').dropdown({
    on: 'hover'
  });

  $('.ui.sidebar').sidebar({
    context: $('.bottom.segment')
  }).sidebar('attach events', '#tools .item:eq(1)');

})
