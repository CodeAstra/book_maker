module ApplicationHelper
  def landing_page?
    controller_name == "home" && action_name == "land"
  end

  def flash_messages_tag
    str = ""

    flash.each do |fl|
      fl[0] = "success" if fl[0] == "notice"
      fl[0] = "danger" if fl[0] == "error" || fl[0] == "alert"
      str += content_tag(:div, class: "alert alert-#{fl[0]}") do
        content_tag(:button, class: "close", data: {dismiss: "alert"}) do
          content_tag(:span, raw("&times;"))
        end + fl[1]
      end
    end

    return raw(str)
  end

  def refresh_flash_message
    raw "BookMakerUtils.showFlash('#{j flash_messages_tag}');"
  end
end
