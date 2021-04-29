class Application < ApplicationRecord
  include Enumerizable
  belongs_to :user
  belongs_to :room

  validates :user_name, presence: true
  validates :user_eamil, presence: true
  validates :user_phone_number, presence: true
end
