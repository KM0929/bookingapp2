class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :reservation_start, presence: true
  validates :reservation_end, presence: true
  validates :reservation_people, presence: true, numericality: true
end
