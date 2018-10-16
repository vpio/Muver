class StaticPagesController < ApplicationController
  before_action :return_if_has_listings, only: [:thanks]

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

  private
  def return_if_has_listings
    redirect_back(fallback_location: root_path,
                  warning: "You need to create a listing to be able to access that page! 🧐") if current_user.listings.empty?
  end


end
