module ApplicationHelper
  def link_class(ctrl, act) 
    if ctrl == controller.controller_name and act == controller.action_name
      'active'
    end
  end
end
