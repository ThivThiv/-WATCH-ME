class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_brand_and_model,
    against: [ :brand, :model ],
    using: {
      tsearch: { prefix: true }
    }

  def average_rating
    total = 0
    self.reviews.each do |review|
      total += review.rating.to_i
    end
    if self.reviews.size != 0
      total/self.reviews.size
    else
      total
    end
  end
end
