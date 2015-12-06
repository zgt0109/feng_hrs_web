module CashOutHelper
  # 列表页提现状态显示
  def render_common_cash_out_state(params)
    if params.pending?
      html_class = 'blue'
    elsif params.confirmed?
      html_class = 'green'
    else
      html_class = 'red'
    end
      content_tag(:span, params.aasm.human_state,
                  class: "ui #{html_class} small label")
  end

  # 详情页提现状态显示
  def render_common_label_class(params)
    params.pending? ? 'blue' : params.confirmed? ? 'green' : 'red'
  end

  # 状态为通过时，只能查看，无修改、删除操作
  def link_to_unless_with_block condition, options, html_options={}, &block
     unless condition
       link_to options, html_options, &block
     else
       capture &block
     end
   end
end
