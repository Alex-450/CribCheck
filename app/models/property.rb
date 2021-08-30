class Property < ApplicationRecord
  belongs_to :user
  belongs_to :landlord
  has_many :reviews
end
