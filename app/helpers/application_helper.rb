module ApplicationHelper
  def render_main_class
    "#{params[:controller].gsub('/', '-')} #{params[:action]}"
  end
end
