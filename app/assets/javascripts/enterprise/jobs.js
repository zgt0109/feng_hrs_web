//测试信息
//job advanced
$('#job_advance').attr('disabled', !this.checked);
$(':checkbox[name=isAdvance]').change(function() {
  $('#job_advance').attr('disabled', !this.checked);
})
