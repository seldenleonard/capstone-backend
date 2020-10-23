class User < ApplicationRecord

  has_many :artworks
  has_many :upvotes
  belongs_to :college, optional: true
  has_many :upvoted_artworks, through: :upvotes, source: :artwork

end