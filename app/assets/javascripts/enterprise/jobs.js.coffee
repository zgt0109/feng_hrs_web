$ ->
  # cocoon
  $('#job_commission_people a.add_fields').data('association-insertion-method', 'before').
                                           data('association-insertion-node', 'this')

  $('#job_commission_day a.add_fields').data('association-insertion-method', 'before').
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
  $('#job_commission_day').hide()
  $('.ui.buttons.commission .button').click ->
    $('.remove_fields.dynamic').click()
    $('.add_fields').click()

    $('.ui.buttons.commission .button').removeClass('teal')
    $(this).addClass('teal')
    if $(this).hasClass('first') || $(this).hasClass('second')
      if $(this).hasClass('first')
        tmp   = '月'
        unit  = 'permonth'
      else
        tmp  = '时'
        unit = 'perhour'

      $('#commission_flg').val('person')
      $('[id^=job_job_commission_people_attributes][id$=unit]').val(unit)
      $('[id^=job_job_commission_people_attributes][id$=amount]').attr('placeholder', '元/人/'+tmp)
      $('#job_commission_people').show()
      $('#job_commission_day').hide()

    if $(this).hasClass('third')
      $('#commission_flg').val('day')
      $('#job_commission_people').hide()
      $('#job_commission_day').show()
