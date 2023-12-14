class Booking < ApplicationRecord
  belongs_to :teapot
  belongs_to :user
end
