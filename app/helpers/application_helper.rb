module ApplicationHelper
  def landing_page?
    controller_name == "home" && action_name == "land"
  end
end
