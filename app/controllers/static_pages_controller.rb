class StaticPagesController < ApplicationController

  def home
  end

  def thanks
    @user = current_user
  end

end
