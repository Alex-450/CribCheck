class Landlord < ApplicationRecord
  has_many :properties
  validates :name, presence: true
  has_many :reviews, through: :properties
end
