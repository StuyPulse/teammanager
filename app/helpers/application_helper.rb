module ApplicationHelper
  def active_class(path)
    current_page?(path) ? "active" : ""
  end

  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when "success"
      "alert-success"
    when "error"
      "alert-error"
    when "alert"
      "alert-block"
    when "notice"
      "alert-info"
    else
      flash_type.to_s
    end
  end
end
