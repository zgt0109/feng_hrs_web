module VerifyHelper
  def render_verify_link
    params = get_biz_domain == 'zhao' ? [new_zhao_verification_zhao_path, '招聘方验证'] : [new_song_verification_agent_path, '经纪方验证']

    content_tag :a, href: params.first, class: 'item' do
      concat content_tag :i, '', class: 'thumbs outline up icon'
      concat params.last
    end
  end

  # 验证信息
  def render_admin_verify_status(data)
    zhao = data.zhao_status.try(:status)
    agent = data.agent_status.try(:status)
    content_tag :span do
      if zhao then
        concat content_tag :a, data.zhao_status.aasm.human_state,
        href: zhao_verification_admin_enterprise_path(data), class: 'ui yellow label'
      end
      if agent then
        concat content_tag :a, data.agent_status.aasm.human_state,
        href: agent_verification_admin_enterprise_path(data), class: 'ui yellow label'
      end
      unless zhao || agent
        content_tag :a, '没有申请', href: 'javascript:;', class: 'ui label grey'
      end
    end
  end
end
