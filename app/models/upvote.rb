class Upvote < ApplicationRecord

  validates :artwork, presence: true
  validates :user_id, presence: true

  belongs_to :artwork
  belongs_to :user

end