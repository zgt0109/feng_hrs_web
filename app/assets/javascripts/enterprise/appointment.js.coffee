$ ->
  $('.appointment').click ->
    ids = $.map $(':checkbox[name=singular_check]:checked'), (item) ->
      $(item).val()
    if ids.length == 0
      return alert '请选择至少一个工友'

    if $(this).data('jobid')
      target = "/song/appointments/appoint?labor_ids=" + ids + "&job_id=" + $(this).data('jobid')
    else
      target = "/song/jobs?labor_ids=" + ids
    window.location.replace(target)
