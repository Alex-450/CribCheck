class AddDefaultToReview < ActiveRecord::Migration[6.0]
  def change
    change_column :reviews, :maintenance, :integer, default: 3
    change_column :reviews, :cleanliness, :integer, default: 3
    change_column :reviews, :landlord_rating, :integer, default: 3
    change_column :reviews, :property_rating, :integer, default: 3
    change_column :reviews, :communication, :integer, default: 3
  end
end
