class MapsController < ApplicationController
  def show
    respond_to do |format|
      format.html do
        @coordinates = request.location.coordinates.reverse
        @coordinates = [0.0, 0.0] if @coordinates.empty?
      end
      format.json do
        @listings = Listing.all
        render json:  {
           type: "FeatureCollection",
           features: @listings.map do |listing|
             {
               type: "Feature",
               geometry: {
                 type: "Point",
                 coordinates: [
                   listing.longitude,
                   listing.latitude
                 ]
               },
               properties: {
                 description: "
                 <strong>#{listing.description}: $#{listing.price}</strong></div>",
                 icon: "star",
                 id: listing.id
               }
             }
           end
         }
      end
    end
  end
end
