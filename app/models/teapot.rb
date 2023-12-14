class Teapot < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos, dependent: :destroy

  validates :style, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :price_per_day, presence: true, numericality: true
end
