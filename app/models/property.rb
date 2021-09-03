class Property < ApplicationRecord
  belongs_to :user
  belongs_to :landlord
  has_many :reviews, dependent: :destroy
  validates_presence_of :address, :user_id, :landlord_id
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
