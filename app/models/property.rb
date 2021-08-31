class Property < ApplicationRecord
  belongs_to :user
  belongs_to :landlord
  has_many :reviews
  validates_presence_of :address, :user_id, :landlord_id
end
