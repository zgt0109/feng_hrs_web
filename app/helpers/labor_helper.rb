module LaborHelper
  # 获取完成地址: 上海市市辖区浦东新区
  def render_common_china_city_address(param)
    ChinaCity.get(param.district, prepend_parent: true)
  end

  # 手机号码显示: 186-2124-8234
  def render_common_mobile(mobile)
    "#{mobile.slice(0,3)}-#{mobile.slice(3,4)}-#{mobile.slice(7,4)}"
  end

  # 年龄显示: 男-25岁
  def render_labor_gender_with_age(labor)
    "#{labor.gender_text}-#{((Date.today - labor.birthday) / 365).floor}岁"
  end

  # 工友来源显示
  def render_labor_channel(labor)
    channel = labor.channel_text
    if channel == '登记'
      content_tag(:span, channel, class: 'ui teal small label')
    else
      content_tag(:span, channel, class: 'ui blue small label')
    end

  end

  # 工友状态显示
  def render_labor_state(labor)
    state = labor.aasm.human_state
    if labor.yidengji?
      content_tag(:span, state, class: 'ui teal small label')
    elsif labor.yibaoming?
      content_tag(:span, state, class: 'ui blue small label')
    elsif labor.yimianshi?
      content_tag(:span, state, class: 'ui olive small label')
    elsif labor.yiruzhi?
      content_tag(:span, state, class: 'ui green small label')
    elsif labor.yilizhi?
      content_tag(:span, state, class: 'ui red small label')
    else
      content_tag(:span, state, class: 'ui grey small label')
    end
  end
end
