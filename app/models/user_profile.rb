class UserProfile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :country, presence: true
end
