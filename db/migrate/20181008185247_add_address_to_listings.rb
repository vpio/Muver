class AddAddressToListings < ActiveRecord::Migration[5.2]
  def change
  add_column :listings, :street, :string
  add_column :listings, :city, :string
  add_column :listings, :state, :string
  add_column :listings, :country, :string
  add_column :listings, :ip, :string
  add_column :listings, :latitude, :float
  add_column :listings, :longitude, :float
  end
end
