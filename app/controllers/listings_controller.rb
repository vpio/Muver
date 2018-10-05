class ListingsController < ApplicationController
  def index
    @listings = current_user.listings
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listings_path,
        notice: 'Listing was successfully created.'
    else
      redirect_to listings_path,
        alert: "Could not save listing: #{@listing.errors.full_messages.join(', ')}"
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:description)
  end
end
