module ApplicationHelper
  def render_main_class
    "#{params[:controller].gsub('/', '-')} #{params[:action]}"
  end

  def get_biz_domain
    request.path.slice(/zhao|song|hr|admin/)
  end
end
