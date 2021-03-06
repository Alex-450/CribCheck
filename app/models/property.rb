class Property < ApplicationRecord
  belongs_to :user
  belongs_to :landlord
  has_many :reviews, dependent: :destroy
  validates_presence_of :address, :user_id, :landlord_id
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
    against: :address,
    associated_against: {
      landlord: :name
    },
    using: {
      tsearch: { prefix: true }
    }

  def average_rating(rating_type)
    ratings = 0
    reviews.map { |review| ratings += review[rating_type].to_f }
    ratings / reviews.count
  end

  def average_property_rating
    average_rating('property_rating')
  end

  def average_landlord_rating
    average_rating('landlord_rating')
  end

  def average_communication_rating
    average_rating('communication')
  end

  def average_maintenance_rating
    average_rating('maintenance')
  end

  def average_cleanliness_rating
    average_rating('cleanliness')
  end

  def average_rating_overall
    all_ratings = []
    all_ratings.push(
      average_property_rating,
      average_landlord_rating,
      average_communication_rating,
      average_maintenance_rating,
      average_cleanliness_rating
    )
    all_ratings.sum / all_ratings.count
  end
end
