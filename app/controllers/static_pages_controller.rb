class StaticPagesController < ApplicationController

  def home
  end

  def thanks
    @user = current_user
    @id = current_user.listings.last.id
  end

end
