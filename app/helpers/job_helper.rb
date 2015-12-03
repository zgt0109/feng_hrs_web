module JobHelper
  def render_job_text_field(f, column)
    f.text_field column, placeholder: t(".holder.#{column}"),
    title: t(".popup.#{column}"), class: 'popmessage'
  end
end
