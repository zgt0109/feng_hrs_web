//测试信息
//job advanced
$(':checkbox[name=isAdvance]').change(function() {
  $('#job_advance').val(null);
  $('#job_advance').attr('disabled', !this.checked);
})

//job unlimited
$(':checkbox[name=wish_unkown_count]').change(function() {
  var male = '#job_job_quantity_attributes_wish_male_count';
  var female = '#job_job_quantity_attributes_wish_female_count';
  var unkown = '#job_job_quantity_attributes_wish_unkown_count';
  
  $(male).val(null);
  $(female).val(null);
  $(unkown).val(null);

  $(male).attr('disabled', this.checked);
  $(female).attr('disabled', this.checked);
  $(unkown).attr('disabled', !this.checked);
})
