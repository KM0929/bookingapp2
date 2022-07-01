class Room < ApplicationRecord
  belongs_to :user
  has_many :reservation
  mount_uploader :room_image, ImageUploader
end
