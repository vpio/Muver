module StaticPagesHelper
  def show_notifications
    content_tag(:p, "hello")
    notifications = current_user.notifications.map do |n|
      if n.read_status == "false"
        content_tag(:p, (link_to n.message, [@notification, n], method: :put), class:"dropdown-item")
      end
    end
    if notifications.join("").empty?
      return content_tag(:p, "No new notifications!", class:"dropdown-item" )
    else
      return notifications.join("").html_safe
    end
  end

  def user_avatar(user_id)
      user = User.find(user_id)
      if user.avatar.attached?
        image_tag url_for(current_user.avatar), :class => 'navbar-profile-picture'
      else
        image_tag 'avatar-placeholder.png', :class => 'navbar-profile-picture'
      end
  end
end
