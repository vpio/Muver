class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.text :message
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.boolean :approved, :default => false

      t.timestamps
    end
  end
end
