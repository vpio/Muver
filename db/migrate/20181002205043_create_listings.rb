class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :description
      t.string :starting_address
      t.string :ending_address
      t.integer :price
      t.string :difficulty
      t.string :date
      t.string :time
      t.string :contact

      t.timestamps
    end
  end
end
