class Booking < ApplicationRecord
  belongs_to :teapot
  belongs_to :user
  has_many_attached :photos

  validates :start_date, :end_date, :status, presence: true
  validates :total_price, presence: true, numericality: true
end
