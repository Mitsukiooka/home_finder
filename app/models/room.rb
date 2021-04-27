class Room < ApplicationRecord
  belongs_to :owner
  has_many_attached :images

  validates :name, presence: true

  attr_accessor :image_blob_id
end
