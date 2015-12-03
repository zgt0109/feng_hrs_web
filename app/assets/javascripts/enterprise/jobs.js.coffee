$ ->
  # cocoon
  $('#job_commission_people a.add_fields').data('association-insertion-method', 'before').
                                           data('association-insertion-node', 'this')

  # 测试信息
  # job advanced
  $(':checkbox[name=isAdvance]').change ->
    $('#job_advance').val(null)
    $('#job_advance').attr('disabled', !this.checked)

  # job unlimited
  $(':checkbox[name=wish_unkown_count]').change ->
    male = '#job_job_quantity_attributes_wish_male_count'
    female = '#job_job_quantity_attributes_wish_female_count'
    unkown = '#job_job_quantity_attributes_wish_unkown_count'
    $(male).val(null)
    $(female).val(null)
    $(unkown).val(null)
    $(male).attr('disabled', this.checked)
    $(female).attr('disabled', this.checked)
    $(unkown).attr('disabled', !this.checked)

  # commission
  $('.ui.buttons.commission .button').click ->
    $('.ui.buttons.commission .button').removeClass('teal')
    $(this).addClass('teal')
    if $(this).hasClass('first') || $(this).hasClass('second')
      tmp = if $(this).hasClass('first') then '月' else '天'
      $('[id^=job_job_commission_people_attributes][id$=amount]').attr('placeholder', '元/人/'+tmp)
