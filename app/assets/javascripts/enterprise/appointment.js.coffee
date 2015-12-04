$ ->
  $('.appointment').click ->
    ids = $.map $(':checkbox[name=singular_check]:checked'), (item) ->
      $(item).val()
    if ids.length == 0
      alert '请选择至少一个工友'
    else
      window.location.replace("/song/jobs?labor_ids=" + ids)
