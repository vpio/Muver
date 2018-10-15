module MessagesHelper
  def user_avatar(user_id)
    user = User.find(user_id)
    if user.avatar.attached?
      image_tag url_for(current_user.avatar), :size => '50x50', :class => 'navbar- aprofile-picture'
    else
      image_tag 'avatar-placeholder.png', :size => '50x50', :class => 'navbar-profile-picture'
    end
  end
end
