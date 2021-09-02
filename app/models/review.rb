class Review < ApplicationRecord
  belongs_to :property
  belongs_to :user
  has_many :chatrooms
  has_one :landlord, through: :properties
  has_many_attached :photos
  validates_presence_of :landlord_comment, :property_comment
  validates_presence_of :landlord_rating, :property_rating, :rental_cost, :communication, :maintenance, :cleanliness
end
