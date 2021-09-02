class Review < ApplicationRecord
  belongs_to :property
  belongs_to :user
  has_many :chatrooms
  has_one :landlord, through: :properties
  has_many_attached :photos
  validates :landlord_comment, :property_comment, presence: true
  validates :landlord_rating, :property_rating, :rental_cost, :communication, :maintenance, :cleanliness, presence: true
end
