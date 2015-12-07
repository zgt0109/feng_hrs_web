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
  def render_labor_state(param)
    state = param.state
    state_color = { 'registed' => 'teal', 'appointed' => 'blue','checkin' => 'olive',
                     'passed' => 'green', 'refused' => 'red' }

    if state_color.include?(state)
      html_class = state_color[state]
    else
      html_class = 'grey'
    end

    content_tag(:span,  param.aasm.human_state,
                class: "ui #{html_class} small label")
  end


  def render_zhao_labor_isIndex
    current_page?(action: :appointed_labors)
  end

  # 状态切换按钮
  def render_labor_transition_button(data)
    appointment = data.appointment
    button_style = { :reject => ['red', '面试失败'], :pass => ['green', '面试通过'],
                     :checkin => ['blue', '入职'], :refuse => ['violet', '未入职'],
                     :turnover => ['yellow', '已离职'] }
    content_tag 'div' do
      appointment.aasm.events.map(&:name).each do |keyword|
        concat link_to button_style[keyword][1], zhao_transition_path(appointment, transition_keyword: keyword),
        class: "ui button mini #{button_style[keyword][0]}"
      end
    end
  end

end
