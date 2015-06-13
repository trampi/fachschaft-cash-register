module ApplicationHelper

  def articles_controller?
    controller.controller_name == 'articles'
  end

  def reports_controller?
    controller.controller_name == 'reports'
  end

  def settings_controller?
    controller.controller_name == 'settings'
  end

end
