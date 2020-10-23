class User < ApplicationRecord

  has_many :artworks
  has_many :upvotes
  belongs_to :college

end