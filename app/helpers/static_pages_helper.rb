module StaticPagesHelper
  def show_notifications
    content_tag(:p, "hello")
    notifications = current_user.notifications.map do |n|
      content_tag(:p, (link_to n.message, listing_path(n.proposal.listing.id)), class:"dropdown-item")
    end
    return notifications.join("").html_safe
  end
end
