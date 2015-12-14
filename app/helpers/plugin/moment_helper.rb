module Plugin::MomentHelper

  def render_plugin_moment(timestamp, html_css='')
    content_tag(:span, timestamp, class: "moment #{html_css}")
  end

end
