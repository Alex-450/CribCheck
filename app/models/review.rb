class Review < ApplicationRecord
  belongs_to :property
  belongs_to :user
  has_many :chatrooms
  has_one :landlord, through: :properties
end
