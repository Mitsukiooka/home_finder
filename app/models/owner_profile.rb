class OwnerProfile < ApplicationRecord
  belongs_to :owner

  validates :country, presence: true
end
