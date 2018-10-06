class GuestsController < ApplicationController

  def index
    @listings = Listing.all
  end

end
