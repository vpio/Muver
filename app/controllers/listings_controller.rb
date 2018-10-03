class ListingsController < ApplicationController
  def index
    @listings = current_user.listings
  end
end
