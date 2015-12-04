module JobHelper
  def render_job_text_field(f, column)
    f.text_field column, placeholder: t(".holder.#{column}"),
    title: t(".popup.#{column}"), class: 'popmessage'
  end

  # 薪资
  def render_job_string(*params)
    params.join('')
  end

  # 预支
  def render_job_advance(data)
    data.advance.blank? ? '不可预支' : t('.advance', advance: data.advance)
  end

  # 区分zhao和song
  def render_job_current_zhao(param=nil)
    current_page?('/zhao/jobs') ? param || true : nil
  end
end
