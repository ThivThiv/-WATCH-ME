class Review < ApplicationRecord
  belongs_to :watch
  validates :content, :rating, presence: true
  validates :watch_id, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: (0..5)}
end
