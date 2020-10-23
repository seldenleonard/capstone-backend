class Artwork < ApplicationRecord

  belongs_to :user
  has_many :images
  has_many :upvotes
  has_many :users, through: :upvotes

end