module JobHelper
  def render_job_text_field(f, column, bool=false)
    f.text_field column, placeholder: t(".holder.#{column}"),
    title: t(".popup.#{column}"), class: 'popmessage', disabled: bool
  end

  # 薪资
  def render_job_string(*params)
    params.join('')
  end

  # 预支
  def render_job_advance(data)
    data.advance.blank? ? '不可预支' : t('.advance', advance: data.advance)
  end

  # 招聘人数
  def render_job_quantity(data)
    male = data.job_quantity.wish_male_count
    female = data.job_quantity.wish_female_count
    unknown = data.job_quantity.wish_unkown_count
    (male.blank? ?    '' : "男(#{male})") +
    (female.blank? ?  '' : "女(#{female})") +
    (unknown.blank? ? '' : "不限(#{unknown})")
  end

  # 佣金
  def render_job_commission(data)
    tmp = ''
    people = data.job_commission_people
    day = data.job_commission_days
    if people.present? then
      people.each do |p|
        tmp << simple_format("#{p.gender_text}: #{p.amount}#{p.unit_text}，共返利#{p.deadline}个月，每月#{p.check}号对名单，#{p.remit}天内到账 \n")
      end
    elsif day.present? then
      day.each do |d|
        tmp << simple_format("#{d.gender_text}入职#{d.deadline}天后返#{d.amount}元")
      end
    end
    return tmp
  end

  # 区分zhao和song
  def render_job_current_zhao(param=nil)
    current_page?('/zhao/jobs') ? param || true : nil
  end

  # 送人按钮
  def render_job_appoint_button(job)
    unless render_job_current_zhao
      if @labor_ids
        link_to '送人', appoint_song_appointments_path(labor_ids: @labor_ids, job_id: job.id),
          class: 'ui teal button tiny right floated'
      else
        link_to "送人", song_labors_path(job_id: job.id),
          class: 'ui teal button tiny right floated'
      end
    else
      content_tag :div, class: 'ui teal buttons tiny right floated' do
        concat (render_scaffold_job_path job)
        concat (content_tag :div, class: 'ui floating dropdown icon button' do
          concat (content_tag :i , nil, class: 'dropdown icon')
          concat (content_tag :div, class: 'menu' do
            concat (render_scaffold_edit_job_path job)
            concat (render_saffold_destroy_job_path job)
          end)
        end)
      end
    end

  end

end
