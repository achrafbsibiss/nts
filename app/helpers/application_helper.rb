module ApplicationHelper

  def pagination(records)
    render partial: "shared/pagination", locals: {records: records}
  end

  def inline_error_for(field, form_obj)
    html = []
    if form_obj.errors[field].any?
      html << form_obj.errors[field].map do |msg|
        tag.div(msg, class: "text-red-400 text-xs m-0 p-0 text-right mb-2")
      end
    end
    html.join
  end
  
  def active_class(path)
    current_page?(path) ? "active" : ""
  end

  def link_sidebar(path)
    current_page?(path) ? " rounded-lg bg-gray-700 text-white" : ""
  end
end
