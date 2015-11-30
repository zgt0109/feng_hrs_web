module Plugin::MomentHelper

  def render_plugin_moment(timestamp)
    content_tag(:span, timestamp, class: 'moment')
  end

end
