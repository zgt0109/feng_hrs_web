module ScaffoldHelper
  # 选择一条数据
  def render_scaffold_checkbox_one(id, bool=false)
    content_tag(:div, class: 'ui checkbox') do
      check_box_tag('singular_check', id, false, disabled: bool) + label_tag(nil)
    end
  end

  # 选择所有数据
  def render_scaffold_checkbox_selectall
    content_tag(:div, class: 'ui icon button basic selectedAll small popMessage',
                      title: t('action.check_all')) do
      check_box_tag 'selectAll'
    end
  end

  # 删除所选数据
  def render_scaffold_checkbox_delete()
    content_tag(:div, class: 'ui icon button basic small popMessage',
                      title: t('action.delete')) do
      content_tag(:i, nil, class: 'trash outline icon')
    end
  end

  # saffold
  %w(
    labor company contact job enterprise
    debit page
  ).each do |model|
    class_eval{
      # new
      define_method "render_scaffold_new_#{model}_path" do
        html_class= "ui button positive small"
        link_to t("action.new"), [:new, get_biz_domain, model], class: html_class
      end

      # index
      define_method "render_scaffold_#{model.pluralize}_path" do
          html_class= "ui negative button"
          link_to t("action.back"), [get_biz_domain, model.pluralize], class: html_class
      end

      # show
      define_method "render_scaffold_#{model}_path", ->(object) do
        html_class= "ui button"
        link_to t("action.show"), [get_biz_domain, object], class: html_class
      end

      # edit
      define_method "render_scaffold_edit_#{model}_path", ->(object) do
        html_class= "item"
        link_to [:edit, get_biz_domain, object], class: html_class do
          content_tag(:i, nil, class: 'edit icon') + t("action.edit")
        end
      end

      define_method "render_scaffold_edit_#{model}_path_link", ->(object) do
        html_class= "ui button positive"
        link_to [:edit, get_biz_domain, object], class: html_class do
          content_tag(:i, nil, class: 'edit icon') + t("action.edit")
        end
      end

      # destroy
      define_method "render_saffold_destroy_#{model}_path", ->(object) do
        html_class= "item"
        link_to [get_biz_domain, object], method: :delete, class: html_class,
                data: { confirm: t('action.confirm_delete') } do
          content_tag(:i, nil, class: 'trash icon') + t("action.delete")
        end
      end

      define_method "render_scaffold_form_path", ->(object) do
        [get_biz_domain, object]
      end
    }
  end

end
