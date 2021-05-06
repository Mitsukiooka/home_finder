class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :country, presence: true
end
