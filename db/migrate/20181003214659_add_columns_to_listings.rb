class AddColumnsToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :stairs, :boolean
    add_column :listings, :max_people, :integer
  end
end
