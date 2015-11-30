//= require moment/moment
//= require moment/locale/zh-cn.js

$(function(){
  $('.moment').each(function() {
    form_time = moment(new Date(this.textContent));
    seven_days_ago = moment().subtract(7, 'days');
    if(form_time.isBefore(seven_days_ago))
      this.textContent = form_time.format('LL');
    else
      this.textContent = form_time.fromNow();
  })
})
