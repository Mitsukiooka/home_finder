class Room < ApplicationRecord
  include Enumerizable

  belongs_to :owner
  has_many :applications
  has_many_attached :images
  has_one_attached :outside_image

  validates :name, presence: true
  validates :address, presence: true
  validates :country, presence: true

  scope :by_status, ->{ where(status: :active) }
  scope :by_country, ->(country){ where(country: country)}

  attr_accessor :image_blob_id

end
