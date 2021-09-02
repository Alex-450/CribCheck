class Review < ApplicationRecord
  belongs_to :property
  belongs_to :user
  has_many :chatrooms
  has_one :landlord, through: :properties
  has_many_attached :photos
  validates :landlord_rating, inclusion: { in: 0..5 }
end
