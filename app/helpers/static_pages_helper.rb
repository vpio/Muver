module StaticPagesHelper
  def show_notifications
    content_tag(:p, "hello")
    notifications = current_user.notifications.map do |n|
      if n.read_status == false
        content_tag(:p, (link_to n.message, [@notification, n], method: :put), class:"dropdown-item")
      end
    end
    if notifications.join("").empty?
      return content_tag(:p, "No new notifications!", class:"dropdown-item" )
    else
      return notifications.join("").html_safe
    end
  end
end
