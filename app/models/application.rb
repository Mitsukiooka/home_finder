class Application < ApplicationRecord
  include Enumerizable
  belongs_to :user
  belongs_to :room

  validates :user_name, presence: true
  validates :user_email, presence: true
  validates :user_phone_number, presence: true

  def already_applied?(user, room)
    if self.user_id == user && self.room_id == room
      return true
    else 
      return false
    end
  end
end
