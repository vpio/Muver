class GuestsController < ApplicationController

  def index
    if params[:zipcode].present?
      @coordinates = Geocoder.search(params[:zipcode] + " USA").first.coordinates.reverse
    end
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

end
