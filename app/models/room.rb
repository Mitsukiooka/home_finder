class Room < ApplicationRecord
  include Enumerizable

  belongs_to :owner
  has_many :applications
  has_many_attached :images

  validates :name, presence: true

  scope :by_status, ->{ where(status: :active) }

  attr_accessor :image_blob_id
end
