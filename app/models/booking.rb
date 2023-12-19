class Booking < ApplicationRecord
  belongs_to :teapot
  belongs_to :user
  has_many_attached :photos

  validates :start_date, :status, presence: true
  validates :end_date, presence: true, comparison: { greater_than: :start_date }
  validates :total_price, presence: true, numericality: true
end
