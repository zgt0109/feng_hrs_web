module AdminHelper
  # 所属企业help
  def render_common_enterprise_name(params)
    admin_enterprise_path(params.enterprise.id)
  end
end
