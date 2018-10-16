class StaticPagesController < ApplicationController

  def home
    @full_width = true
  end

  def thanks
    @user = current_user
    @id = current_user.listings.last.id
  end

  def response_page
    user = current_user || ""
    @user =
    unless user.is_a?(String)
      current_user.first_name
    else
      user
    end
  end

end
