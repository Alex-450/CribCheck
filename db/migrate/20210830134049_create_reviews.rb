class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :landlord_rating
      t.integer :property_rating
      t.text :landlord_comment
      t.text :property_comment
      t.integer :rental_cost
      t.integer :communication
      t.integer :maintenance
      t.integer :cleanliness
      t.references :property, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
