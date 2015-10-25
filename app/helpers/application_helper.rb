module ApplicationHelper
  def active_class(path)
    current_page?(path) ? 'active' : ''
  end
end
