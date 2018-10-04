class ListingsController < ApplicationController
  def index
    @listings = current_user.listings
  end

  def create
    @description = params[:description]
    @listing = current_user.listings.new(description: @description)
    if @listing.save
      redirect_to listings_path,
        notice: 'Listing was successfully created.'
    else
      redirect_to listings_path,
        alert: "Could not save listing: #{@listing.errors.full_messages.join(', ')}"
    end
  end
end
